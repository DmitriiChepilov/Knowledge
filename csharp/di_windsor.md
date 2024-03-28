## Default lifestyle
Castle Windsor’s default lifestyle is `Singleton`


## How to register decorator

```csharp
// interface
public interface IThing
{
  string SayHello(string name);
}

// implementation
public class ThingOne : IThing
{
  public string SayHello(string name)
  {
    return string.Format("ThingOne says hello to {0}", name);
  }
}

// decorator
public class ThingDecorator : IThing
{
  private readonly IThing thing;

  public ThingDecorator(IThing thing)
  {
    this.thing = thing;
  }

  public string SayHello(string name)
  {
    Console.WriteLine("Before calling wrapped IThing");
    var message = thing.SayHello(name);
    Console.WriteLine("After calling wrapped IThing");
    return message;
  }
}

// register decorator
var container = new WindsorContainer();
container.Register(
    Component.For<IThing>().ImplementedBy<ThingDecorator>(),
    Component.For<IThing>().ImplementedBy<ThingOne>()
    );

```

Source link: [Here’s part four of (at least) 10 Advanced Windsor Trick](https://mikehadlow.blogspot.com/2010/01/10-advanced-windsor-tricks-4-how-to.html)
