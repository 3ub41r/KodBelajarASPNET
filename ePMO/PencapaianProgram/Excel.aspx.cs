﻿using Dapper;
using ePMO.Entities;
using ExcelDataReader;
using System;
using System.Collections.Generic;
using System.IO;

namespace ePMO.PencapaianProgram
{
    public partial class Excel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindMuatNaikExcel();
        }

        protected void UploadBtn_Click(object sender, EventArgs e)
        {
            // Upload file
            var originalFileNamefileName = Path.GetFileName(ExcelFileUpload.FileName);

            // Get file extension
            if (string.IsNullOrEmpty(originalFileNamefileName)) return;

            var ext = originalFileNamefileName.Substring(originalFileNamefileName.LastIndexOf(".", StringComparison.Ordinal) + 1).ToLower();
            var newFileName = DateTime.Now.ToString("yyyyMMddHHmmssfff") + "." + ext;

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

            int muatNaikId;

            using (var c = ConnectionFactory.GetConnection())
            {
                var excelFile = new MuatNaikExcel
                {
                    NamaAsal = originalFileNamefileName,
                    NamaBaru = newFileName,
                    TarikhMuatNaik = DateTime.Now,
                    Lokasi = uploadLocation
                };

                muatNaikId = c.QuerySingle<int>(sql, excelFile);
            }

            // Baca excel menggunakan ExcelDataReader
            using (var stream = ExcelFileUpload.PostedFile.InputStream)
            {
                using (var reader = ExcelReaderFactory.CreateReader(stream))
                {
                    // Skip first row - header row
                    reader.Read();

                    // Loop rows
                    while (reader.Read())
                    {
                        // Insert masuk PencapaianProgramExcel
                        const string insert = @"
                        INSERT INTO PencapaianProgramExcel (KodProgram, TarikhProgram, BilanganHari, Lulus, IdMuatNaikExcel, Ralat)
                        VALUES (@KodProgram, @TarikhProgram, @BilanganHari, @Lulus, @IdMuatNaikExcel, @Ralat)";

                        var ralat = new List<string>();

                        // Semak tarikh
                        var tarikhProgram = reader.GetValue(1);
                        var tarikhProgramStr = tarikhProgram?.ToString() ?? "";
                        try
                        {
                            DateTime.Parse(tarikhProgramStr);
                        }
                        catch (Exception exception)
                        {
                            ralat.Add(exception.ToString());
                        }

                        var row = new PencapaianProgramExcel
                        {
                            KodProgram = reader.GetValue(0).ToString(),
                            TarikhProgram = tarikhProgramStr,
                            BilanganHari = reader.GetValue(2).ToString(),
                            Lulus = reader.GetValue(3).ToString(),
                            IdMuatNaikExcel = muatNaikId,
                            Ralat = string.Join(", ", ralat)
                        };

                        using (var c = ConnectionFactory.GetConnection())
                        {
                            c.Execute(insert, row);
                        }
                    }
                }
            }

            Response.Redirect($"~/PencapaianProgram/ViewExcel.aspx?Id={muatNaikId}");
        }

        protected void BindMuatNaikExcel()
        {
            const string sql = "SELECT * FROM MuatNaikExcel";

            using (var c = ConnectionFactory.GetConnection())
            {
                var muatNaik = c.Query<MuatNaikExcel>(sql);
                MuatNaikRepeater.DataSource = muatNaik;
                MuatNaikRepeater.DataBind();
            }
        }
    }
}