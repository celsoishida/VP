<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UF.aspx.cs" Inherits="VP.cad.UF" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

<div id="coluna1">
<h2>Tabela de Estado</h2>
<asp:ImageButton ID="ImageButtonNovo1" runat="server" ImageUrl="~/Images/insert.png" OnClick="ImageButtonNovo1_Click" Width="20px" />
<asp:GridView ID="GridViewEstado" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" PageSize=30
	CellPadding="4" ForeColor="#333333" GridLines="None" 
	DataKeyNames="ID" DataSourceID="SqlDataSourceEstado" EmptyDataText="Tabela sem registros."
	OnRowEditing="GridViewEstado_RowEditing" OnRowUpdated="GridViewEstado_RowUpdated" OnRowCancelingEdit="GridViewEstado_RowCancelingEdit" 
	OnSelectedIndexChanged="GridViewEstado_SelectedIndexChanged" 
	OnRowDeleted="GridViewEstado_RowDeleted" 
	>
	<Columns>
		<asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" ReadOnly="True" />
		<asp:BoundField DataField="Descricao" HeaderText="Descricao" SortExpression="Descricao" />
            <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/update.png" SelectText="Atualizar" ShowSelectButton="True" ControlStyle-Width="20px" >
				<ControlStyle Width="20px"></ControlStyle>
			</asp:CommandField>
            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/delete.png" DeleteText="Apagar" ShowDeleteButton="True" ControlStyle-Width="20" >
				<ControlStyle Width="20px"></ControlStyle>
            </asp:CommandField>
    </Columns>
        <EditRowStyle BackColor="#7C6F57" />        <RowStyle BackColor="#E3EAEB" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />        <SortedDescendingHeaderStyle BackColor="#15524A" />
</asp:GridView>
	<asp:SqlDataSource ID="SqlDataSourceEstado" runat="server" ConnectionString="<%$ ConnectionStrings:sistemaConnectionString %>" 
		DeleteCommand="EstadoD" DeleteCommandType="StoredProcedure"
		InsertCommand="EstadoIU" InsertCommandType="StoredProcedure"
		UpdateCommand="EstadoIU" UpdateCommandType="StoredProcedure"
		SelectCommand="EstadoS" SelectCommandType="StoredProcedure" >
		<SelectParameters>
		</SelectParameters>
		<DeleteParameters>
			<asp:Parameter Name="ID" Type="String" />
		</DeleteParameters>
		<InsertParameters>
			<asp:Parameter Name="ID" Type="String" />
			<asp:Parameter Name="Descricao" Type="String" />
		</InsertParameters>
		<UpdateParameters>
			<asp:Parameter Name="ID" Type="String" />
			<asp:Parameter Name="Descricao" Type="String" />
		</UpdateParameters>
	</asp:SqlDataSource>
</div>
<div = id="coluna2">
<asp:ImageButton ID="ImageButtonNovo2" runat="server" ImageUrl="~/Images/insert.png" OnClick="ImageButtonNovo2_Click" Width="20px" />
<asp:DetailsView ID="DetailsViewEstado" runat="server" AllowPaging="True" AutoGenerateRows="False"
	DataKeyNames="ID" DataSourceID="SqlDataSourceEstadoDV" 
	OnItemDeleted="DetailsViewEstado_ItemDeleted" OnItemInserted="DetailsViewEstado_ItemInserted" OnItemUpdated="DetailsViewEstado_ItemUpdated" 
	CellPadding="4" ForeColor="#333333" GridLines="None" 
	>
	<Fields>
		<asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" ReadOnly="True" />
		<asp:BoundField DataField="Descricao" HeaderText="Descricao" SortExpression="Descricao" />
            <asp:CommandField DeleteText="Apagar" ShowDeleteButton="True" 
				ShowEditButton="True" EditText="Editar" 
				ShowInsertButton="True" InsertText="Inserir" />
    </Fields>

            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
            <EditRowStyle BackColor="#7C6F57" />
            <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
</asp:DetailsView>
	<asp:SqlDataSource ID="SqlDataSourceEstadoDV" runat="server" ConnectionString="<%$ ConnectionStrings:sistemaConnectionString %>" 
		DeleteCommand="EstadoD" DeleteCommandType="StoredProcedure"
		InsertCommand="EstadoIU" InsertCommandType="StoredProcedure"
		UpdateCommand="EstadoIU" UpdateCommandType="StoredProcedure"
		SelectCommand="View_EstadoS" SelectCommandType="StoredProcedure">
		<SelectParameters>
			<asp:ControlParameter ControlID="GridViewEstado" Name="ID" PropertyName="SelectedValue" Type="String" />
		</SelectParameters>
		<DeleteParameters>
			<asp:Parameter Name="ID" Type="String" />
		</DeleteParameters>
		<InsertParameters>
			<asp:Parameter Name="ID" Type="String" />
			<asp:Parameter Name="Descricao" Type="String" />
		</InsertParameters>
		<UpdateParameters>
			<asp:Parameter Name="ID" Type="String" />
			<asp:Parameter Name="Descricao" Type="String" />
		</UpdateParameters>
	</asp:SqlDataSource>
</div>



</asp:Content>
