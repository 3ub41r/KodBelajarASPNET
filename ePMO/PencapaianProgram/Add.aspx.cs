using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dapper;

namespace ePMO.PencapaianProgram
{
    public partial class Add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            Save();
        }

        protected void Save()
        {
            const string sql = @"
            INSERT INTO PencapaianProgram (KodProgram, TarikhProgram, Lulus, JenisKemasukan)
            VALUES (@KodProgram, @TarikhProgram, @Lulus, 'Manual')";

            var conn = ConfigurationManager.ConnectionStrings["ePMO"].ToString();
            using (var c = new SqlConnection(conn))
            {
                c.Execute(sql, new
                {
                    KodProgram = KodProgram.Text,
                    TarikhProgram = TarikhProgram.Text,
                    Lulus = Lulus.Checked
                });
            }
        }
    }
}