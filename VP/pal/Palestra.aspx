<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Palestra.aspx.cs" Inherits="VP.pal.Palestra" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox> <br />
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>


    <div id="coluna1">
<h2>Cadastro de Palestra</h2>
    <asp:DropDownList ID="DropDownListEvento" runat="server"  AutoPostBack="True"
        DataSourceID="SqlDataSourceDDEvento" 
 DataTextField="Descricao" DataValueField="Codigo"></asp:DropDownList>
    <asp:DropDownList ID="DropDownListEventoVersao" runat="server"  AutoPostBack="True"
        DataSourceID="SqlDataSourceDDEventoVersao" 
 DataTextField="Descricao" DataValueField="Codigo"></asp:DropDownList>
<asp:Label ID="LabelMensagem" runat="server"></asp:Label>
<asp:GridView ID="GridViewPalestra" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" PageSize=30
	CellPadding="4" ForeColor="#333333" GridLines="None" 
	DataKeyNames="Evento, EventoVersao, Codigo" DataSourceID="SqlDataSourcePalestra" EmptyDataText="Tabela sem registros."
	OnRowEditing="GridViewPalestra_RowEditing" OnRowUpdated="GridViewPalestra_RowUpdated" OnRowCancelingEdit="GridViewPalestra_RowCancelingEdit" 
	OnSelectedIndexChanged="GridViewPalestra_SelectedIndexChanged" 
	OnRowDeleted="GridViewPalestra_RowDeleted" 
	>
	<Columns>
		<asp:BoundField DataField="Evento" HeaderText="Evento" SortExpression="Evento" ReadOnly="True" Visible="False" />
		<asp:BoundField DataField="EventoVersao" HeaderText="EventoVersao" SortExpression="EventoVersao" ReadOnly="True" Visible="False" />
		<asp:BoundField DataField="Codigo" HeaderText="Codigo" SortExpression="Codigo" ReadOnly="True" />
		<asp:BoundField DataField="Descricao" HeaderText="Descricao" SortExpression="Descricao" />
		<asp:BoundField DataField="Observacao" HeaderText="Observacao" SortExpression="Observacao" />
		<asp:BoundField DataField="DataHora" HeaderText="DataHora" SortExpression="DataHora" />
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
	<asp:SqlDataSource ID="SqlDataSourcePalestra" runat="server" ConnectionString="<%$ ConnectionStrings:sistemaConnectionString %>" 
		DeleteCommand="PalestraD" DeleteCommandType="StoredProcedure"
		InsertCommand="PalestraIU" InsertCommandType="StoredProcedure"
		UpdateCommand="PalestraIU" UpdateCommandType="StoredProcedure"
		SelectCommand="PalestraS" SelectCommandType="StoredProcedure" >
		<SelectParameters>
			<asp:ControlParameter ControlID="DropDownListEvento" Name="Evento" PropertyName="SelectedValue" Type="Int32" />
			<asp:ControlParameter ControlID="DropDownListEventoVersao" Name="EventoVersao" PropertyName="SelectedValue" Type="Int32" />
		</SelectParameters>
		<DeleteParameters>
			<asp:Parameter Name="Evento" Type="Int32" />
			<asp:Parameter Name="EventoVersao" Type="Int32" />
			<asp:Parameter Name="Codigo" Type="Int32" />
		</DeleteParameters>
		<InsertParameters>
			<asp:Parameter Name="Evento" Type="Int32" />
			<asp:Parameter Name="EventoVersao" Type="Int32" />
			<asp:Parameter Name="Codigo" Type="Int32" />
			<asp:Parameter Name="Descricao" Type="String" />
			<asp:Parameter Name="Observacao" Type="String" />
		</InsertParameters>
		<UpdateParameters>
			<asp:Parameter Name="Evento" Type="Int32" />
			<asp:Parameter Name="EventoVersao" Type="Int32" />
			<asp:Parameter Name="Codigo" Type="Int32" />
			<asp:Parameter Name="Descricao" Type="String" />
			<asp:Parameter Name="Observacao" Type="String" />
		</UpdateParameters>
	</asp:SqlDataSource>
</div>
<div = id="coluna2">
<asp:ImageButton ID="ImageButtonNovo2" runat="server" ImageUrl="~/Images/insert.png" OnClick="ImageButtonNovo2_Click" Width="20px" />
<asp:DetailsView ID="DetailsViewPalestra" runat="server" AllowPaging="True" AutoGenerateRows="False"
	DataKeyNames="Evento, EventoVersao, Codigo" DataSourceID="SqlDataSourcePalestraDV" 
	OnItemDeleted="DetailsViewPalestra_ItemDeleted" OnItemInserted="DetailsViewPalestra_ItemInserted" OnItemUpdated="DetailsViewPalestra_ItemUpdated" 
	OnItemInserting="DetailsViewPalestra_ItemInserting"
	CellPadding="4" ForeColor="#333333" GridLines="None" 
	>
	<Fields>
		<asp:TemplateField HeaderText="Codigo" SortExpression="Codigo">
            <ItemTemplate>
                <asp:Label ID="LabelCodigo" runat="server" Text='<%# Bind("Codigo") %>'></asp:Label>
            </ItemTemplate>
            <InsertItemTemplate>
                <asp:Label ID="LabelCodigo" runat="server" Text='<%# Bind("Codigo") %>'></asp:Label>
            </InsertItemTemplate>
            <EditItemTemplate>
                <asp:Label ID="LabelCodigo" runat="server" Text='<%# Bind("Codigo") %>'></asp:Label>
            </EditItemTemplate>
		</asp:TemplateField>
		<asp:BoundField DataField="Descricao" HeaderText="Descricao" SortExpression="Descricao" />
		<asp:BoundField DataField="Observacao" HeaderText="Observacao" SortExpression="Observacao" />
		<asp:TemplateField HeaderText="DataHora" SortExpression="DataHora" InsertVisible="false">
			<ItemTemplate>
				<asp:Label ID="LabelDataHora1" runat="server" Text='<%# Bind("DataHora") %>'></asp:Label>
			</ItemTemplate>
		</asp:TemplateField>
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
	<asp:SqlDataSource ID="SqlDataSourcePalestraDV" runat="server" ConnectionString="<%$ ConnectionStrings:sistemaConnectionString %>" 
		DeleteCommand="PalestraD" DeleteCommandType="StoredProcedure"
		InsertCommand="PalestraIU" InsertCommandType="StoredProcedure"
		UpdateCommand="PalestraIU" UpdateCommandType="StoredProcedure"
		SelectCommand="View_PalestraS" SelectCommandType="StoredProcedure">
		<SelectParameters>
			<asp:ControlParameter ControlID="GridViewPalestra" Name="Evento" PropertyName="SelectedValue" Type="Int32" />
			<asp:ControlParameter ControlID="GridViewPalestra" Name="EventoVersao" PropertyName="SelectedValue" Type="Int32" />
			<asp:ControlParameter ControlID="GridViewPalestra" Name="Codigo" PropertyName="SelectedValue" Type="Int32" />
		</SelectParameters>
		<DeleteParameters>
			<asp:Parameter Name="Evento" Type="Int32" />
			<asp:Parameter Name="EventoVersao" Type="Int32" />
			<asp:Parameter Name="Codigo" Type="Int32" />
		</DeleteParameters>
		<InsertParameters>
			<asp:Parameter Name="Evento" Type="Int32" />
			<asp:Parameter Name="EventoVersao" Type="Int32" />
			<asp:Parameter Name="Codigo" Type="Int32" />
			<asp:Parameter Name="Descricao" Type="String" />
			<asp:Parameter Name="Observacao" Type="String" />
			<asp:Parameter Name="DataHora" Type="DateTime" />
		</InsertParameters>
		<UpdateParameters>
			<asp:Parameter Name="Evento" Type="Int32" />
			<asp:Parameter Name="EventoVersao" Type="Int32" />
			<asp:Parameter Name="Codigo" Type="Int32" />
			<asp:Parameter Name="Descricao" Type="String" />
			<asp:Parameter Name="Observacao" Type="String" />
			<asp:Parameter Name="DataHora" Type="DateTime" />
		</UpdateParameters>
	</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSourceDDEvento" runat="server" ConnectionString="<%$ ConnectionStrings:sistemaConnectionString %>" 
	SelectCommand="EventoS2"  SelectCommandType="StoredProcedure">
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSourceDDEventoVersao" runat="server" ConnectionString="<%$ ConnectionStrings:sistemaConnectionString %>" 
	SelectCommand="EventoVersaoS2"  SelectCommandType="StoredProcedure">
    		<SelectParameters>
			<asp:ControlParameter ControlID="DropDownListEvento" Name="Evento" PropertyName="SelectedValue" Type="Int32" />
		</SelectParameters>

</asp:SqlDataSource>
</div>


</asp:Content>
