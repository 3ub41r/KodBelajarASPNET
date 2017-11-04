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

        <div class="form-group">
            <asp:Button ID="UploadBtn" CssClass="btn btn-primary" runat="server" Text="Muat Naik" OnClick="UploadBtn_Click" />
        </div>

        <asp:Repeater ID="MuatNaikRepeater" runat="server">
            <HeaderTemplate>
                <table class="table">
                    <thead>
                    <tr>
                        <th>Nama Asal</th>
                        <th>Nama Baru</th>
                        <th>Tarikh</th>
                    </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%# Eval("NamaAsal") %></td>
                    <td><%# Eval("NamaBaru") %></td>
                    <td><%# Eval("TarikhMuatNaik") %></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </tbody>
            </table>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
