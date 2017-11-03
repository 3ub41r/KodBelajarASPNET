<%@ Page Title="" Language="C#" MasterPageFile="~/Metronic.Master" AutoEventWireup="true" CodeBehind="Excel.aspx.cs" Inherits="ePMO.PencapaianProgram.Excel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- BEGIN: Subheader -->
    <div class="m-subheader ">
        <div class="d-flex align-items-center">
            <div class="mr-auto">
                <h3 class="m-subheader__title ">
                    Tambah Pencapaian Program (Excel)
                </h3>
            </div>
        </div>
    </div>
    <!-- END: Subheader -->
    <div class="m-content">
        <div class="form-group">
            <label class="custom-file">
                <asp:FileUpload ID="ExcelFileUpload" CssClass="custom-file-input" runat="server" />
                <span class="custom-file-control"></span>
            </label>
        </div>
        
        <asp:Button ID="UploadBtn" CssClass="btn btn-primary" runat="server" Text="Muat Naik" />
    </div>
</asp:Content>
