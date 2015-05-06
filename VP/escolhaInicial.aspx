<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="escolhaInicial.aspx.cs" Inherits="VP.escolhaInicial" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Label ID="LabelUsuario" runat="server" Text="Usuario"></asp:Label>
    <asp:DropDownList ID="DropDownListUsuario" runat="server"  AutoPostBack="True" DataSourceID="SqlDataSourceDDUsuario"
		DataTextField="Nome" DataValueField="Codigo"></asp:DropDownList>
	<asp:SqlDataSource ID="SqlDataSourceDDUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:sistemaConnectionString %>" 
		SelectCommand="UsuarioS2"  SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    <br />
    <asp:Label ID="LabelEvento" runat="server" Text="Evento"></asp:Label>
    <asp:DropDownList ID="DropDownListEvento" runat="server"  AutoPostBack="True" DataSourceID="SqlDataSourceDDEvento"
		DataTextField="Descricao" DataValueField="Codigo"></asp:DropDownList>
	<asp:SqlDataSource ID="SqlDataSourceDDEvento" runat="server" ConnectionString="<%$ ConnectionStrings:sistemaConnectionString %>" 
		SelectCommand="EventoS2"  SelectCommandType="StoredProcedure"></asp:SqlDataSource>

        <asp:Label ID="LabelEventoVersao" runat="server" Text="EventoVersao"></asp:Label>
    <asp:DropDownList ID="DropDownListEventoVersao" runat="server"  AutoPostBack="True" DataSourceID="SqlDataSourceDDEventoVersao"
		DataTextField="Descricao" DataValueField="EventoVersao"></asp:DropDownList>
	<asp:SqlDataSource ID="SqlDataSourceDDEventoVersao" runat="server" ConnectionString="<%$ ConnectionStrings:sistemaConnectionString %>" 
		SelectCommand="EventoVersaoS2"  SelectCommandType="StoredProcedure">
        <SelectParameters>
			<asp:ControlParameter ControlID="DropDownListEvento" Name="Evento" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
	</asp:SqlDataSource>
    <br />
    
    <asp:Label ID="Label1" runat="server" Text="Tela"></asp:Label> <asp:TextBox ID="TextBox1" runat="server" Text="pal/Palestra"></asp:TextBox>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Associar" OnClick="Button1_Click" />

</asp:Content>
