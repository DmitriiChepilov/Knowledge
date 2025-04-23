## Default lifestyle

Castle Windsor’s default lifestyle is `Singleton`

```csharp
container.Register(Component.For<IService>().ImplementedBy<MyService>()); // implicit Singleton
container.Register(Component.For<IService>().Instance(_myService).LifestyleSingleton()); // explicit Singleton
```

## Using factory method

```csharp
container.Register(
    Component.For<IFoobar>()
        .UsingFactoryMethod(CreateFoobar)
        .LifestyleSingleton());
```
