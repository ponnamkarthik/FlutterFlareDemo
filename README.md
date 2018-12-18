
  
## Flutter Flare Demo    
 Hello All    
    
In Flutter Live 2018 few important announcement's are    
* Flare    
* Square    
* PlatformViews (To know how to use click here).    
* HummingBird    
    
Here in this article you will learn about `Flare` and How to use it in.    
    
Lets Start    
    
## Step 1 :    
 Import flare dependency into your flutter project    
    
```yaml    
flare_flutter: ^1.0.4 
```

 ## Step 2:    
 Create a flare project [Here](https://www.2dimensions.com/) or use an existing one  [Here](https://www.2dimensions.com/explore/popular/trending/all)  
  
In this article i am using a minion from [here](https://www.2dimensions.com/a/tracygipson/files/flare/minion/preview)  
  
Inside flare editor we will a list of animations avialable with the minion design  
  
![Animation List](https://i.imgur.com/EJkR51B.png)  
  
Now click on export on the top Right > Export  
  
![Export](https://i.imgur.com/lEyBI9y.png)  
  
Now select Flutter, Select Binary Click on `Export`  
  
![Export Flutter](https://i.imgur.com/Sq0UnVy.png)  
    
  Now Copy the download file and paste it in `project_dir/images/` folder  
  
## Step 3  
  
Import flare inside your dart file      
```dart 
import 'package:flare_flutter/flare_actor.dart'; 
```

## Step 4  
Inside pubspec.yaml file enable access to copied flare files  
  
```yaml 
assets:    
  - images/  
```

## Step 5  
  
Now lets create a `FlareActor` and pass the `.flr` file to it  
  
```dart  
FlareActor(    
  "images/minion.flr",    
  alignment: Alignment.center,    
  fit: BoxFit.contain,    
  animation: "Look", 
)  
```

In the above code animation takes a String i.e., the name of the animation as shown in the Step 2  
  
## Step 6  
  
Inside our dart file lets make bottons and add animtions to each one   
  
```dart  
String _animation = "idle";

void doAnimate(String anim) {
  setState(() {
    _animation = anim;
  });
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(widget.title),
    ),
    body: Column(
      children: <Widget>[
        //flare actor
        Expanded(
          child: FlareActor(
            "images/minion.flr",
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: _animation,
          ),
        ),
        //animations
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text("Look"),
              onPressed: () {
                doAnimate("Look");
              },
            ),
            RaisedButton(
              child: Text("Dance"),
              onPressed: () {
                doAnimate("Dance");
              },
            ),
            RaisedButton(
              child: Text("Stand"),
              onPressed: () {
                doAnimate("Stand");
              },
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text("Jump"),
              onPressed: () {
                doAnimate("Jump");
              },
            ),
            RaisedButton(
              child: Text("Wave"),
              onPressed: () {
                doAnimate("Wave");
              },
            )
          ],
        )
      ],
    ),
  );
}
```

In the above code we declare a varibale `_animation` and assign it a value `idle` as inital state and when we click on a button we change the `_animation` to a sutiable animation  
  
Our animation function  

```dart  
void doAnimate(String anim) {
  setState(() {
    _animation = anim;
  });
}  
```
  
## Demo

![Flare Demo Output](https://i.imgur.com/Vsz6EhH.gif =250x)
  
## Step 7 (Optional) - Additional  
  
Inorder to get full control of the animation  we need to use `FlareController`  
  
we need to make our statefull widget to implement `FlareController` and our `FlareActor` will become like this.  
  
```dart  
FlareActor(    
  "images/minion.flr",    
  alignment: Alignment.center,    
  fit: BoxFit.contain,    
  animation: _animation,    
)  
```
  
and we need to `override` few methods from the `FlareController`   
```dart  
@override
bool advance(FlutterActorArtboard artboard, double elapsed) {
  // TODO: implement advance
  return null;
}
@override
void initialize(FlutterActorArtboard artboard) {
  // TODO: implement initialize
}
@override
void setViewTransform(Mat2D viewTransform) {
  // TODO: implement setViewTransform
}
```