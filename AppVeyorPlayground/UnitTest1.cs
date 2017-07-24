using System;
using Xunit;

namespace AppVeyorPlayground
{
    public class UnitTest1
    {
        [Fact]
        public void Passes()
        {
            Assert.True(true);
        }

        [Fact]
        public void Fails()
        {
            Assert.True(false);
        }
    }
}
