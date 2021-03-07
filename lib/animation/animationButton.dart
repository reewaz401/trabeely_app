import 'dart:async';
import 'package:flutter/material.dart';

enum ButtonState {
  idle,
  loading,
}

class ProgressButton extends StatefulWidget {
  final Map<ButtonState, Widget> stateWidgets;
  final Map<ButtonState, Color> stateColors;
  final Function onPressed;
  final Function onAnimationEnd;
  final ButtonState state;
  final minWidth;
  final maxWidth;
  final radius;
  final height;
  final ProgressIndicator progressIndicator;
  final MainAxisAlignment progressIndicatorAligment;
  final EdgeInsets padding;

  ProgressButton({
    Key key,
    @required this.stateWidgets,
    @required this.stateColors,
    this.state = ButtonState.idle,
    this.onPressed,
    this.onAnimationEnd,
    this.minWidth = 100.0,
    this.maxWidth = 200.0,
    this.radius = 16.0,
    this.height = 53.0,
    this.progressIndicator,
    this.progressIndicatorAligment = MainAxisAlignment.spaceBetween,
    this.padding = EdgeInsets.zero,
  })  : assert(
          stateWidgets != null &&
              stateWidgets.keys.toSet().containsAll(ButtonState.values.toSet()),
          'Must be non-null widgetds provided in map of stateWidgets. Missing keys => ${ButtonState.values.toSet().difference(stateWidgets.keys.toSet())}',
        ),
        assert(
          stateColors != null &&
              stateColors.keys.toSet().containsAll(ButtonState.values.toSet()),
          'Must be non-null widgetds provided in map of stateWidgets. Missing keys => ${ButtonState.values.toSet().difference(stateColors.keys.toSet())}',
        ),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProgressButtonState();
  }

  factory ProgressButton.icon({
    @required Map<ButtonState, IconedButton> iconedButtons,
    Function onPressed,
    ButtonState state = ButtonState.idle,
    Function animationEnd,
    maxWidth: 170.0,
    minWidth: 58.0,
    height: 53.0,
    radius: 100.0,
    double iconPadding: 4.0,
    TextStyle textStyle,
    CircularProgressIndicator progressIndicator,
    MainAxisAlignment progressIndicatorAligment,
    EdgeInsets padding = EdgeInsets.zero,
  }) {
    assert(
      iconedButtons != null &&
          iconedButtons.keys.toSet().containsAll(ButtonState.values.toSet()),
      'Must be non-null widgets provided in map of stateWidgets. Missing keys => ${ButtonState.values.toSet().difference(iconedButtons.keys.toSet())}',
    );

    if (textStyle == null) {
      textStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.w500);
    }

    Map<ButtonState, Widget> stateWidgets = {
      ButtonState.idle: buildChildWithIcon(
          iconedButtons[ButtonState.idle], iconPadding, textStyle),
      ButtonState.loading: Column(),
    };

    Map<ButtonState, Color> stateColors = {
      ButtonState.idle: iconedButtons[ButtonState.idle].color,
      ButtonState.loading: iconedButtons[ButtonState.loading].color,
    };

    return ProgressButton(
      stateWidgets: stateWidgets,
      stateColors: stateColors,
      state: state,
      onPressed: onPressed,
      onAnimationEnd: animationEnd,
      maxWidth: maxWidth,
      minWidth: minWidth,
      radius: radius,
      height: height,
      progressIndicatorAligment: MainAxisAlignment.center,
      progressIndicator: progressIndicator,
    );
  }
}

class _ProgressButtonState extends State<ProgressButton>
    with TickerProviderStateMixin {
  AnimationController colorAnimationController;
  Animation<Color> colorAnimation;
  double width;
  Duration animationDuration = Duration(milliseconds: 500);
  Widget progressIndicator;

  void startAnimations(ButtonState oldState, ButtonState newState) {
    Color begin = widget.stateColors[oldState];
    Color end = widget.stateColors[newState];
    if (newState == ButtonState.loading) {
      width = widget.minWidth;
    } else {
      width = widget.maxWidth;
    }
    colorAnimation = ColorTween(begin: begin, end: end).animate(CurvedAnimation(
      parent: colorAnimationController,
      curve: Interval(
        0,
        1,
        curve: Curves.easeIn,
      ),
    ));
    colorAnimationController.forward();
  }

  Color get backgroundColor => colorAnimation == null
      ? widget.stateColors[widget.state]
      : colorAnimation.value ?? widget.stateColors[widget.state];

  @override
  void initState() {
    super.initState();

    width = widget.maxWidth;

    colorAnimationController =
        AnimationController(duration: animationDuration, vsync: this);
    colorAnimationController.addStatusListener((status) {
      if (widget.onAnimationEnd != null) {
        widget.onAnimationEnd(status, widget.state);
      }
    });

    progressIndicator = widget.progressIndicator ??
        CircularProgressIndicator(
            backgroundColor: widget.stateColors[widget.state],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white));
  }

  @override
  void dispose() {
    colorAnimationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(ProgressButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.state != widget.state) {
      colorAnimationController?.reset();
      startAnimations(oldWidget.state, widget.state);
    }
  }

  Widget getButtonChild(bool visibility) {
    Widget buttonChild = widget.stateWidgets[widget.state];
    if (widget.state == ButtonState.loading) {
      return Row(
        mainAxisAlignment: widget.progressIndicatorAligment,
        children: <Widget>[progressIndicator, buttonChild, Container()],
      );
    }
    return AnimatedOpacity(
        opacity: visibility ? 1.0 : 0.0,
        duration: Duration(milliseconds: 250),
        child: buttonChild);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: colorAnimationController,
      builder: (context, child) {
        return AnimatedContainer(
            width: width,
            height: widget.height,
            duration: animationDuration,
            child: RaisedButton(
              padding: widget.padding,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(widget.radius),
                  side: BorderSide(color: Colors.transparent, width: 0)),
              color: backgroundColor,
              onPressed: widget.onPressed,
              child: getButtonChild(
                  colorAnimation == null ? true : colorAnimation.isCompleted),
            ));
      },
    );
  }
}

class IconedButton {
  final String text;
  final Icon icon;
  final Color color;

  const IconedButton({
    this.text = "",
    @required this.icon,
    @required this.color,
  });
}

Widget buildChildWithIcon(
    IconedButton iconedButton, double iconPadding, TextStyle textStyle) {
  return buildChildWithIC(
      iconedButton.text, iconedButton.icon, iconPadding, textStyle);
}

Widget buildChildWithIC(
    String text, Icon icon, double gap, TextStyle textStyle) {
  return Wrap(
    direction: Axis.horizontal,
    crossAxisAlignment: WrapCrossAlignment.center,
    children: <Widget>[
      icon,
      Padding(padding: EdgeInsets.all(gap)),
      buildText(text, textStyle)
    ],
  );
}

Widget buildText(String text, TextStyle style) {
  return Text(text, style: style);
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Progress Button',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProgressButtonHomePage(title: 'Progress Button'),
    );
  }
}

class ProgressButtonHomePage extends StatefulWidget {
  ProgressButtonHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProgressButtonHomePageState createState() => _ProgressButtonHomePageState();
}

class _ProgressButtonHomePageState extends State<ProgressButtonHomePage> {
  ButtonState stateOnlyText = ButtonState.idle;
  ButtonState stateTextWithIcon = ButtonState.idle;

  Widget buildCustomButton() {
    var progressTextButton = ProgressButton(
      stateWidgets: {
        ButtonState.idle: Text(
          "Idle",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        ButtonState.loading: Text(
          "Loading",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      },
      stateColors: {
        ButtonState.idle: Colors.green,
        ButtonState.loading: Colors.blue.shade300,
      },
      onPressed: onPressedCustomButton,
      state: stateOnlyText,
      padding: EdgeInsets.all(8.0),
    );
    return progressTextButton;
  }

  Widget buildTextWithIcon() {
    return ProgressButton.icon(iconedButtons: {
      ButtonState.idle: IconedButton(
          text: "Send",
          icon: Icon(Icons.send, color: Colors.white),
          color: Colors.deepPurple.shade500),
      ButtonState.loading: IconedButton(
          text: "Loading", color: Colors.deepPurple.shade700, icon: null),
    }, onPressed: onPressedIconWithText, state: stateTextWithIcon);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildCustomButton(),
            Padding(
              padding: EdgeInsets.all(32.0),
            ),
            buildTextWithIcon(),
          ],
        ),
      ),
    );
  }

  void onPressedCustomButton() {
    setState(() {
      switch (stateOnlyText) {
        case ButtonState.idle:
          stateOnlyText = ButtonState.loading;
          break;
        case ButtonState.loading:
          stateOnlyText = ButtonState.idle;
          break;
      }
    });
  }

  void onPressedIconWithText() {
    switch (stateTextWithIcon) {
      case ButtonState.idle:
        stateTextWithIcon = ButtonState.loading;
        Future.delayed(Duration(seconds: 1), () {});

        break;
      case ButtonState.loading:
        break;
    }
    setState(() {
      stateTextWithIcon = stateTextWithIcon;
    });
  }
}
