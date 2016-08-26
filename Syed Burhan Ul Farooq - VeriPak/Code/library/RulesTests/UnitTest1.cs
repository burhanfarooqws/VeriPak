using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace RulesTests
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod_15Days()
        {
            DateTime Date1 = DateTime.Now;
            DateTime Date2 = library.Rules.AddBusinessDays(Date1, 14);
            int BusinessDays = library.Rules.GetBusinessDays(Date1, Date2);

            Assert.AreEqual(15, BusinessDays);
        }

        [TestMethod]
        public void TestMethod_30Days()
        {
            DateTime Date1 = DateTime.Now;
            DateTime Date2 = library.Rules.AddBusinessDays(Date1, 29);
            int BusinessDays = library.Rules.GetBusinessDays(Date1, Date2);

            Assert.AreEqual(30, BusinessDays);
        }
    }
}
