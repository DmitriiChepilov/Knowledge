## Set visible internal classes for Test

```csharp
[assembly: InternalsVisibleTo("My.Project.Assembly.Test")]
```

## MSTest

TestInitialize runs **before every test** that is declared on the the **same class** where the attribute is declared.

ClassInitialize runs **only** on the initialization of the class where the attribute is declared. In other words it won't run for every class. Just for the class that contains the ClassInitialize method.

```csharp
[TestClass]
public class MyTestClass
{
    [TestInitialize]
    public void TestInitialize()
    {
    }

    [TestCleanup]
    public void TestCleanup()
    {
    }

    [TestMethod]
    [DataRow(1, "message", true, 2.0)]
    public void TestMethod1(int i, string s, bool b, float f)
    {
    }
}
```

## NUnit

All attributes can be found [here](https://docs.nunit.org/articles/nunit/writing-tests/attributes.html)

```csharp
[TestFixture]
public class MyTestClass
{
    [SetUp]
    public void SetUp()
    {
    }

    [TearDown]
    public void TearDown()
    {
    }

    [Test]
    public void TestMethod1()
    {
    }

    [TestCase(1, "message", true, 2.0)]
    public void TestMethod2(int i, string s, bool b, float f)
    {
    }
}
```
