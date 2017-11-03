<%@ Page Title="" Language="C#" MasterPageFile="~/Metronic.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="ePMO.PencapaianProgram.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- BEGIN: Subheader -->
    <div class="m-subheader ">
        <div class="d-flex align-items-center">
            <div class="mr-auto">
                <h3 class="m-subheader__title ">
                    Pencapaian Program
                </h3>
            </div>
        </div>
    </div>
    <!-- END: Subheader -->
    <div class="m-content">
        <asp:HyperLink ID="AddLink" CssClass="btn btn-primary m-btn m-btn--custom" NavigateUrl="~/PencapaianProgram/Add.aspx" runat="server">Tambah</asp:HyperLink>
    </div>
</asp:Content>
