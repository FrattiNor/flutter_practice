## 路由管理

---

- 方法 1

```
// 路由跳转并传递参数
Navigator.push(
    context,
    MaterialPageRoute(builder: (context) {
        return NewRoute(text: "我是参数");
    }),
);


// 路由返回值
Navigator.pop(context, "我是返回值")
```

- 方法 2 (命名路由)

```
MaterialApp(
    //注册路由表
    routes:{
        "new_page":(context) => NewRoute(),
        ... // 省略其他路由注册信息
    } ,
);

Navigator.pushNamed(context, "new_page");

// 路由传参
Navigator.of(context).pushNamed("new_page", arguments: "hi");

//获取路由参数
var args = ModalRoute.of(context).settings.arguments;
```

- 方法 3

```
MaterialApp(
    onGenerateRoute:(RouteSettings settings){
        return MaterialPageRoute(builder: (context){
                String routeName = settings.name;
                // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由
                // 引导用户登录；其他情况则正常打开路由
        });
    }
);
```
