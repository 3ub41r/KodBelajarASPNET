﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Metronic.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="ePMO.PencapaianProgram.List" %>
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
        <asp:Panel ID="InsertSuccessPanel" CssClass="alert alert-success" Visible="False" runat="server">
            Pencapaian Program berjaya ditambah.
        </asp:Panel>

        <div class="form-group">
            
            
            <div class="btn-group dropdown">
                <asp:HyperLink ID="AddLink" CssClass="btn btn-primary" NavigateUrl="~/PencapaianProgram/Add.aspx" runat="server">Tambah</asp:HyperLink>
                
                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="sr-only">Toggle Dropdown</span>
                </button>
                <div class="dropdown-menu">
                    <asp:HyperLink ID="AddExcelLink" CssClass="dropdown-item" NavigateUrl="~/PencapaianProgram/Excel.aspx" runat="server">Excel</asp:HyperLink>
                </div>
            </div>
        </div>
        
        <asp:Repeater ID="PencapaianProgramRepeater" runat="server">
            <HeaderTemplate>
            <table class="table">
                <thead>
                <tr>
                    <th>Kod</th>
                    <th>Tarikh</th>
                    <th>Lulus</th>
                    <th>Jenis</th>
                </tr>
                </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%# Eval("KodProgram") %></td>
                    <td><%# Eval("TarikhProgram") %></td>
                    <td><%# Eval("Lulus") %></td>
                    <td><%# Eval("JenisKemasukan") %></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </tbody>
            </table>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
