<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="teste.aspx.cs" Inherits="VP.cad.teste" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <div id="coluna1">
<h2>Tabela de EventoVersao</h2>
Evento    <asp:TextBox ID="TextBoxEvento" Visible="false" runat="server"></asp:TextBox>
    <asp:TextBox ID="TextBoxDesEvento" runat="server"></asp:TextBox>
    <asp:DropDownList ID="DropDownListEvento" runat="server"  AutoPostBack="True"
        DataSourceID="SqlDataSourceDDEvento"
 DataTextField="Descricao" DataValueField="Codigo"></asp:DropDownList>
<asp:Label ID="LabelMensagem" runat="server"></asp:Label>
<asp:GridView ID="GridViewEventoVersao" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" PageSize=30
	CellPadding="4" ForeColor="#333333" GridLines="None" 
	DataKeyNames="Evento, EventoVersao" DataSourceID="SqlDataSourceEventoVersao" EmptyDataText="Tabela sem registros."
	OnRowEditing="GridViewEventoVersao_RowEditing" OnRowUpdated="GridViewEventoVersao_RowUpdated" OnRowCancelingEdit="GridViewEventoVersao_RowCancelingEdit" 
	OnSelectedIndexChanged="GridViewEventoVersao_SelectedIndexChanged" 
	OnRowDeleted="GridViewEventoVersao_RowDeleted" 
	>
	<Columns>
		<asp:BoundField DataField="Evento" HeaderText="Evento" SortExpression="Evento" ReadOnly="True" />
		<asp:BoundField DataField="EventoVersao" HeaderText="EventoVersao" SortExpression="EventoVersao" ReadOnly="True" />
		<asp:BoundField DataField="Descricao" HeaderText="Descricao" SortExpression="Descricao" />
		<asp:BoundField DataField="DataInicio" HeaderText="DataInicio" SortExpression="DataInicio" DataFormatString="{0:dd-M-yyyy}" />
		<asp:BoundField DataField="DataFim" HeaderText="DataFim" SortExpression="DataFim" Visible="False" DataFormatString="{0:dd-M-yyyy}" />
		<asp:BoundField DataField="DataHora" HeaderText="DataHora" SortExpression="DataHora" Visible="False" DataFormatString="{0:dd-M-yyyy}" />
		<asp:BoundField DataField="SituacaoEvento" HeaderText="SituacaoEvento" SortExpression="SituacaoEvento" ReadOnly="True" Visible="False" />
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
	<asp:SqlDataSource ID="SqlDataSourceEventoVersao" runat="server" ConnectionString="<%$ ConnectionStrings:sistemaConnectionString %>" 
		DeleteCommand="EventoVersaoD" DeleteCommandType="StoredProcedure"
		InsertCommand="EventoVersaoIU" InsertCommandType="StoredProcedure"
		UpdateCommand="EventoVersaoIU" UpdateCommandType="StoredProcedure"
		SelectCommand="exec EventoVersaoS" >
		<DeleteParameters>
			<asp:Parameter Name="Evento" Type="Int32" />
			<asp:Parameter Name="EventoVersao" Type="Int32" />
		</DeleteParameters>
		<InsertParameters>
			<asp:Parameter Name="Evento" Type="Int32" />
			<asp:Parameter Name="EventoVersao" Type="Int32" />
			<asp:Parameter Name="Descricao" Type="String" />
			<asp:Parameter Name="DataInicio" Type="DateTime" />
			<asp:Parameter Name="DataFim" Type="DateTime" />
			<asp:Parameter Name="DataHora" Type="DateTime" />
			<asp:Parameter Name="SituacaoEvento" Type="Int32" />
		</InsertParameters>
		<UpdateParameters>
			<asp:Parameter Name="Evento" Type="Int32" />
			<asp:Parameter Name="EventoVersao" Type="Int32" />
			<asp:Parameter Name="Descricao" Type="String" />
			<asp:Parameter Name="DataInicio" Type="DateTime" />
			<asp:Parameter Name="DataFim" Type="DateTime" />
			<asp:Parameter Name="DataHora" Type="DateTime" />
			<asp:Parameter Name="SituacaoEvento" Type="Int32" />
		</UpdateParameters>
	</asp:SqlDataSource>
</div>
<div = id="coluna2">
<asp:ImageButton ID="ImageButtonNovo2" runat="server" ImageUrl="~/Images/insert.png" OnClick="ImageButtonNovo2_Click" Width="20px" />
<asp:DetailsView ID="DetailsViewEventoVersao" runat="server" AllowPaging="True" AutoGenerateRows="False"
	DataKeyNames="Evento, EventoVersao" DataSourceID="SqlDataSourceEventoVersaoDV" 
	OnItemDeleted="DetailsViewEventoVersao_ItemDeleted" OnItemInserted="DetailsViewEventoVersao_ItemInserted" OnItemUpdated="DetailsViewEventoVersao_ItemUpdated" 
	CellPadding="4" ForeColor="#333333" GridLines="None" 
	>
	<Fields>
		<asp:TemplateField HeaderText="Evento" SortExpression="Evento">
            <ItemTemplate>
                <asp:Label ID="Label5" runat="server" Text='<%# Bind("DesEvento") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:DropDownList ID="DropDownListEvento1" runat="server" DataSourceID="SqlDataSourceDDEvento" DataTextField="Descricao" DataValueField="Codigo" SelectedValue='<%# Bind("Evento") %>'>
                </asp:DropDownList>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:DropDownList ID="DropDownListEvento2" runat="server" DataSourceID="SqlDataSourceDDEvento" DataTextField="Descricao" DataValueField="Codigo" SelectedValue='<%# Bind("Evento") %>'>
                </asp:DropDownList>
            </InsertItemTemplate>
		</asp:TemplateField>
		<asp:BoundField DataField="EventoVersao" HeaderText="EventoVersao" SortExpression="EventoVersao" ReadOnly="True" />
		<asp:BoundField DataField="Descricao" HeaderText="Descricao" SortExpression="Descricao" />
		<asp:TemplateField HeaderText="DataInicio" SortExpression="DataInicio">
			<ItemTemplate>
				<asp:Label ID="LabelDataInicio1" runat="server" Text='<%# Bind("DataInicio","{0:dd-M-yyyy}") %>'></asp:Label>
			</ItemTemplate>
			<EditItemTemplate>
				<asp:Calendar ID="CalendarDataInicio1" runat="server" SelectedDate='<%# Bind("DataInicio") %>'></asp:Calendar>
			</EditItemTemplate>
			<InsertItemTemplate>
				<asp:Calendar ID="CalendarDataInicio2" runat="server" SelectedDate='<%# Bind("DataInicio") %>'></asp:Calendar>
			</InsertItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField HeaderText="DataFim" SortExpression="DataFim">
			<ItemTemplate>
				<asp:Label ID="LabelDataFim1" runat="server" Text='<%# Bind("DataFim","{0:dd-M-yyyy}") %>'></asp:Label>
			</ItemTemplate>
			<EditItemTemplate>
				<asp:Calendar ID="CalendarDataFim1" runat="server" SelectedDate='<%# Bind("DataFim") %>'></asp:Calendar>
			</EditItemTemplate>
			<InsertItemTemplate>
				<asp:Calendar ID="CalendarDataFim2" runat="server" SelectedDate='<%# Bind("DataFim") %>'></asp:Calendar>
			</InsertItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField HeaderText="DataHora" SortExpression="DataHora">
			<ItemTemplate>
				<asp:Label ID="LabelDataHora1" runat="server" Text='<%# Bind("DataHora","{0:dd-M-yyyy}") %>'></asp:Label>
			</ItemTemplate>
			<EditItemTemplate>
				<asp:Calendar ID="CalendarDataHora1" runat="server" SelectedDate='<%# Bind("DataHora") %>'></asp:Calendar>
			</EditItemTemplate>
			<InsertItemTemplate>
				<asp:Calendar ID="CalendarDataHora2" runat="server" SelectedDate='<%# Bind("DataHora") %>'></asp:Calendar>
			</InsertItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField HeaderText="SituacaoEvento" SortExpression="SituacaoEvento">
            <ItemTemplate>
                <asp:Label ID="Label5" runat="server" Text='<%# Bind("DesSituacaoEvento") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:DropDownList ID="DropDownListSituacaoEvento1" runat="server" DataSourceID="SqlDataSourceDDSituacaoEvento" DataTextField="Descricao" DataValueField="Codigo" SelectedValue='<%# Bind("SituacaoEvento") %>'>
                </asp:DropDownList>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:DropDownList ID="DropDownListSituacaoEvento2" runat="server" DataSourceID="SqlDataSourceDDSituacaoEvento" DataTextField="Descricao" DataValueField="Codigo" SelectedValue='<%# Bind("SituacaoEvento") %>'>
                </asp:DropDownList>
            </InsertItemTemplate>
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
	<asp:SqlDataSource ID="SqlDataSourceEventoVersaoDV" runat="server" ConnectionString="<%$ ConnectionStrings:sistemaConnectionString %>" 
		DeleteCommand="EventoVersaoD" DeleteCommandType="StoredProcedure"
		InsertCommand="EventoVersaoIU" InsertCommandType="StoredProcedure"
		UpdateCommand="EventoVersaoIU" UpdateCommandType="StoredProcedure"
		SelectCommand="View_EventoVersaoS" SelectCommandType="StoredProcedure">
		<SelectParameters>
			<asp:ControlParameter ControlID="GridViewEventoVersao" Name="Codigo" PropertyName="SelectedValue" Type="Int32" />
		</SelectParameters>
		<DeleteParameters>
			<asp:Parameter Name="Evento" Type="Int32" />
			<asp:Parameter Name="EventoVersao" Type="Int32" />
		</DeleteParameters>
		<InsertParameters>
			<asp:Parameter Name="Evento" Type="Int32" />
			<asp:Parameter Name="EventoVersao" Type="Int32" />
			<asp:Parameter Name="Descricao" Type="String" />
			<asp:Parameter Name="DataInicio" Type="DateTime" />
			<asp:Parameter Name="DataFim" Type="DateTime" />
			<asp:Parameter Name="DataHora" Type="DateTime" />
			<asp:Parameter Name="SituacaoEvento" Type="Int32" />
		</InsertParameters>
		<UpdateParameters>
			<asp:Parameter Name="Evento" Type="Int32" />
			<asp:Parameter Name="EventoVersao" Type="Int32" />
			<asp:Parameter Name="Descricao" Type="String" />
			<asp:Parameter Name="DataInicio" Type="DateTime" />
			<asp:Parameter Name="DataFim" Type="DateTime" />
			<asp:Parameter Name="DataHora" Type="DateTime" />
			<asp:Parameter Name="SituacaoEvento" Type="Int32" />
		</UpdateParameters>
	</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSourceDDEvento" runat="server" ConnectionString="<%$ ConnectionStrings:sistemaConnectionString %>" 
	SelectCommand="EventoS2"  SelectCommandType="StoredProcedure"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSourceDDSituacaoEvento" runat="server" ConnectionString="<%$ ConnectionStrings:sistemaConnectionString %>" 
	SelectCommand="SituacaoEventoS2"  SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</div>

    </form>
</body>
</html>
