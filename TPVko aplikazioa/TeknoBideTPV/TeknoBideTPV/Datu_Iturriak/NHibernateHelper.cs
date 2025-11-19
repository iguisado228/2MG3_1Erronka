using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FluentNHibernate.Cfg;
using FluentNHibernate.Cfg.Db;
using NHibernate;
using NHibernate.Tool.hbm2ddl;
using TeknoBideTPV.Mappings;

namespace TeknoBideTPV.Data
{

    public static class NHibernateHelper
    {
        private static ISessionFactory sessionFactory;

        public static ISessionFactory SessionFactory
        {
            get
            {
                if (sessionFactory == null)
                {
                    sessionFactory = Fluently.Configure()
                        .Database(MySQLConfiguration.Standard
                            .ConnectionString(c => c
                                .Server("localhost")
                                .Database("2mg3_1erronka")
                                .Username("root")
                                .Password("1MG2024")))
                        .Mappings(m => m.FluentMappings.AddFromAssemblyOf<LangileaMap>())
                        .BuildSessionFactory();
                }
                return sessionFactory;
            }
        }

        public static ISession OpenSession()
        {
            return SessionFactory.OpenSession();
        }
    }
}
