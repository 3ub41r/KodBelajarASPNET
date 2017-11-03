using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.AccessControl;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dapper;
using ePMO.Entities;

namespace ePMO.PencapaianProgram
{
    public partial class Excel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UploadBtn_Click(object sender, EventArgs e)
        {
            // Upload file
            var originalFileNamefileName = Path.GetFileName(ExcelFileUpload.FileName);

            // Get file extension
            if (string.IsNullOrEmpty(originalFileNamefileName)) return;

            var ext = originalFileNamefileName.Substring(originalFileNamefileName.LastIndexOf(".", StringComparison.Ordinal) + 1).ToLower();
            var newFileName = RandomString() + "." + ext;

            // This can be moved to Web.config
            var uploadPath = Server.MapPath("~/Uploads/");

            // Create directory if it does not exists
            var directoryInfo = new FileInfo(uploadPath).Directory;
            directoryInfo?.Create();

            var uploadLocation = uploadPath + newFileName;

            // Save file
            ExcelFileUpload.SaveAs(uploadLocation);

            // Insert into MuatNaikExcel
            const string sql = @"
            INSERT INTO MuatNaikExcel (NamaAsal, NamaBaru, TarikhMuatNaik, Lokasi)
            VALUES (@NamaAsal, @NamaBaru, @TarikhMuatNaik, @Lokasi);
            SELECT CAST(SCOPE_IDENTITY() as int)";

            using (var c = ConnectionFactory.GetConnection())
            {
                var excelFile = new MuatNaikExcel
                {
                    NamaAsal = originalFileNamefileName,
                    NamaBaru = newFileName,
                    TarikhMuatNaik = DateTime.Now,
                    Lokasi = uploadLocation
                };

                var id = c.Query<int>(sql, excelFile);
            }


            
            // Baca setiap row
            // Insert masuk PencapaianProgramExcel
        }

        /// <summary>
        /// Generate random string.
        /// </summary>
        /// <returns></returns>
        protected string RandomString()
        {
            var g = Guid.NewGuid();
            var random = Convert.ToBase64String(g.ToByteArray());
            return random.Replace("=", "").Replace("+", "");
        }
    }
}