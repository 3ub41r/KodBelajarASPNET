﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Metronic.Master" AutoEventWireup="true" CodeBehind="ViewExcel.aspx.cs" Inherits="ePMO.PencapaianProgram.ViewExcel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- BEGIN: Subheader -->
    <div class="m-subheader ">
        <div class="d-flex align-items-center">
            <div class="mr-auto">
                <h3 class="m-subheader__title ">
                    Pencapaian Program (Excel)
                </h3>
            </div>
        </div>
    </div>
    <!-- END: Subheader -->
    <div class="m-content">
        <table class="table table-bordered">
            <tbody>
            <tr>
                <th>Nama Asal</th>
                <td>
                    <asp:Literal ID="NamaAsal" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <th>Nama Baru</th>
                <td>
                    <asp:Literal ID="NamaBaru" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <th>Tarikh Muat Naik</th>
                <td>
                    <asp:Literal ID="TarikhMuatNaik" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <th>File</th>
                <td>
                    <asp:Literal ID="Lokasi" runat="server"></asp:Literal>
                </td>
            </tr>
            </tbody>
        </table>

        <asp:Repeater ID="PenilaianProgramRepeater" runat="server">
            <HeaderTemplate>
                <table>
                    <thead>
                    <tr>
                        <th>Kod Program</th>
                        <th>Tarikh</th>
                        <th>Bilangan Hari</th>
                        <th>Lulus</th>
                    </tr>
                    </thead>
                    <tbody>
                    
                    
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%# Eval("KodProgram") %></td>
                    <td><%# Eval("TarikhProgram") %></td>
                    <td><%# Eval("BilanganHari") %></td>
                    <td><%# Eval("Lulus") %></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </tbody>
            </table>    
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>