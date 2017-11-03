<%@ Page Title="" Language="C#" MasterPageFile="~/Metronic.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="ePMO.PencapaianProgram.Add" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- BEGIN: Subheader -->
    <div class="m-subheader ">
        <div class="d-flex align-items-center">
            <div class="mr-auto">
                <h3 class="m-subheader__title ">
                    Tambah Pencapaian Program
                </h3>
            </div>
        </div>
    </div>
    <!-- END: Subheader -->
    <div class="m-content">
        <div class="form-group m-form__group col-md-6">
            <label>Kod Program</label>
            <asp:TextBox ID="KodProgram" CssClass="form-control m-input" runat="server"></asp:TextBox>
        </div>

        <div class="form-group m-form__group col-md-6">
            <label>Tarikh Program</label>
            <asp:TextBox ID="TarikhProgram" CssClass="form-control m-input" runat="server"></asp:TextBox>
        </div>
        
        <div class="form-group m-form__group col-md-6">
            <div class="m-checkbox-list">
                <label class="m-checkbox">
                    <asp:CheckBox ID="Lulus" runat="server" />
                    Lulus
                    <span></span>
                </label>
            </div>
        </div>

        <asp:Button ID="SubmitBtn" CssClass="btn btn-primary m-btn" runat="server" Text="Simpan" OnClick="SubmitBtn_Click" />
    </div>
</asp:Content>
