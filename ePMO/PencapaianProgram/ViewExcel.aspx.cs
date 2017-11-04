using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dapper;
using ePMO.Entities;

namespace ePMO.PencapaianProgram
{
    public partial class ViewExcel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindMuatNaikExcel();
        }

        protected void BindMuatNaikExcel()
        {
            // Dapatkan rekod MuatNaikExcel
            var id = Request.QueryString["Id"];

            if (string.IsNullOrEmpty(id)) return;

            const string sql = @"SELECT * FROM MuatNaikExcel WHERE Id = @Id";
            var excelId = int.Parse(id);

            using (var c = ConnectionFactory.GetConnection())
            {
                var excel = c.QueryFirstOrDefault<MuatNaikExcel>(sql, new { Id = excelId });

                NamaAsal.Text = excel.NamaAsal;
                NamaBaru.Text = excel.NamaBaru;
                TarikhMuatNaik.Text = excel.TarikhMuatNaik.ToString();
                Lokasi.Text = excel.Lokasi;

                // Dapatkan senarai rekod PencapaianProgram dari MuatNaikExcel
                const string pencapaianSql = @"SELECT * FROM PencapaianProgramExcel WHERE IdMuatNaikExcel = @IdMuatNaikExcel";

                var dataPenilaian = c.Query<PencapaianProgramExcel>(pencapaianSql, new { IdMuatNaikExcel = excelId });
                PenilaianProgramRepeater.DataSource = dataPenilaian;
                PenilaianProgramRepeater.DataBind();
            }
        }
    }
}