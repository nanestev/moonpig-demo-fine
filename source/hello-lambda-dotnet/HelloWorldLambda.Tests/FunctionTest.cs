using Xunit;
using Amazon.Lambda.TestUtilities;

namespace HelloWorldLambda.Tests
{
    public class FunctionTest
    {
        [Fact]
        public void TestToUpperFunction()
        {

            // Invoke the lambda function and confirm the string was upper cased.
            var function = new Function();
            var context = new TestLambdaContext();
            var result = function.FunctionHandler(null, context);

            Assert.Equal(200, result.StatusCode);
            Assert.Equal("Hello world", result.Body);
        }
    }
}
