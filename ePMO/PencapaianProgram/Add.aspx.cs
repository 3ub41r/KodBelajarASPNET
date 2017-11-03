using Dapper;
using System;
using System.Configuration;
using System.Data.SqlClient;

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
                // Insert
                c.Execute(sql, new
                {
                    KodProgram = KodProgram.Text,
                    TarikhProgram = TarikhProgram.Text,
                    Lulus = Lulus.Checked
                });

                // Redirect
                Response.Redirect("~/PencapaianProgram/List.aspx?success=1");
            }
        }
    }
}