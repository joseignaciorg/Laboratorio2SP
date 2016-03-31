<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="VisualWebPart1UserControl.ascx.cs" Inherits="Laboratorio2SP.VisualWebPart1.VisualWebPart1UserControl" %>

<asp:UpdatePanel ID="upTitleChecker" runat="server">

<ContentTemplate>

<div id="titleChecker">

<p>Tenemos los siguientes subsitios:</p>

<asp:ListBox ID="lstWebs" runat="server" SelectionMode="Single" AutoPostBack="True" Rows="10" OnSelectedIndexChanged="lstWebs_SelectedIndexChanged" />

<asp:Panel ID="pnlUpdateControls" runat="server">

<p>Selecciona un sitio para cambiarlo.</p>

<asp:TextBox ID="txtTitle" runat="server" Width="200px" />

<asp:Button ID="btnUpdate" Text="Update" runat="server" OnClick="btnUpdate_Click" />

</asp:Panel>

<asp:Panel ID="pnlResult" runat="server">

<p>

<asp:Literal ID="litResult" runat="server" />

</p>

</asp:Panel>

</div>

</ContentTemplate>

</asp:UpdatePanel>