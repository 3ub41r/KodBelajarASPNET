using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dapper;

namespace ePMO.PencapaianProgram
{
    public partial class List : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["success"] != null)
            {
                DisplayInsertSuccessNotification();
            }


            BindPenilaianProgram();
        }

        protected void DisplayInsertSuccessNotification()
        {
            InsertSuccessPanel.Visible = true;
        }

        protected void BindPenilaianProgram()
        {
            const string sql = "SELECT * FROM PencapaianProgram";

            using (var c = ConnectionFactory.GetConnection())
            {
                var data = c.Query<Entities.PencapaianProgram>(sql);
                PencapaianProgramRepeater.DataSource = data;
                PencapaianProgramRepeater.DataBind();
            }

        }
    }
}