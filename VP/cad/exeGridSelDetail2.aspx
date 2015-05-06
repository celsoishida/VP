<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="exeGridSelDetail2.aspx.cs" Inherits="VP.cad.exeGridSelDetail2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <div id="coluna1">
        <h2>Tabela de Eventos</h2>            
        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/insert.png" OnClick="ImageButtonNovo_Click" Width="20px" />
        
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Codigo" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." PageSize="20" CellPadding="4" ForeColor="#333333" GridLines="None" 
        OnRowDeleted="GridView1_RowDeleted" OnRowEditing="GridView1_RowEditing" OnRowUpdated="GridView1_RowUpdated" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCancelingEdit="GridView1_RowCancelingEdit">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Codigo" HeaderText="Codigo" ReadOnly="True" SortExpression="Codigo" InsertVisible="False" />
            <asp:BoundField DataField="Descricao" HeaderText="Descricao" SortExpression="Descricao" />
            <asp:BoundField DataField="DataHora" HeaderText="DataHora" SortExpression="DataHora" Visible="false" DataFormatString="{0:dd-M-yyyy}" />
            <asp:BoundField DataField="DataInicio" HeaderText="Data de Inicio" SortExpression="DataInicio" DataFormatString="{0:dd-M-yyyy}"/>
            <asp:BoundField DataField="DataFim" HeaderText="DataFim" SortExpression="DataFim" Visible="false" DataFormatString="{0:dd-M-yyyy}"/>
            <asp:BoundField DataField="TipoEvento" HeaderText="TipoEvento" SortExpression="TipoEvento"  Visible="false"/>
            <asp:BoundField DataField="DesTipoEvento" HeaderText="DesTipoEvento" ReadOnly="True" SortExpression="DesTipoEvento" />
            <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/update.png" SelectText="Atualizar" ShowSelectButton="True" ControlStyle-Width="20" >
<ControlStyle Width="20px"></ControlStyle>
            </asp:CommandField>
            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/delete.png" DeleteText="Apagar" ShowDeleteButton="True" ControlStyle-Width="20" >

<ControlStyle Width="20px"></ControlStyle>
            </asp:CommandField>

        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sistemaConnectionString %>" 
        DeleteCommand="EventoD" 
        InsertCommand="EventoIU" 
        SelectCommand="exec EventoS" 
        UpdateCommand="EventoIU" DeleteCommandType="StoredProcedure" InsertCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="Codigo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Codigo" Type="Int32" />
            <asp:Parameter Name="Descricao" Type="String" />
            <asp:Parameter DbType="Date" Name="DataHora" />
            <asp:Parameter DbType="Date" Name="DataInicio" />
            <asp:Parameter DbType="Date" Name="DataFim" />
            <asp:Parameter Name="TipoEvento" Type="Int32" />
            <asp:Parameter Name="DesTipoEvento" Type="String" />
            <asp:Parameter Name="retVar" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Codigo" Type="Int32" />
            <asp:Parameter Name="Descricao" Type="String" />
            <asp:Parameter DbType="Date" Name="DataHora" />
            <asp:Parameter DbType="Date" Name="DataInicio" />
            <asp:Parameter DbType="Date" Name="DataFim" />
            <asp:Parameter Name="TipoEvento" Type="Int32" />
            <asp:Parameter Name="DesTipoEvento" Type="String" />
            <asp:Parameter Name="retVar" Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource>
        </div>
    <div id="coluna2">
        <asp:ImageButton ID="ImageButtonNovo" runat="server" ImageUrl="~/Images/insert.png" OnClick="ImageButtonNovo_Click" Width="20px" />
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="Codigo" DataSourceID="SqlDataSource2" AllowPaging="True"
             OnItemDeleted="DetailsView1_ItemDeleted" OnItemInserted="DetailsView1_ItemInserted" OnItemUpdated="DetailsView1_ItemUpdated" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
            <EditRowStyle BackColor="#7C6F57" />
            <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
            <Fields>
                <asp:TemplateField HeaderText="Codigo" SortExpression="Codigo">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Codigo") %>'></asp:Label>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Codigo") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Codigo") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Descricao" HeaderText="Descricao" SortExpression="Descricao" />
                <asp:TemplateField HeaderText="DataInicio" SortExpression="DataInicio">
                    <EditItemTemplate>
                        <asp:Calendar ID="Calendar2" runat="server" SelectedDate='<%# Bind("DataInicio") %>'></asp:Calendar>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:Calendar ID="Calendar4" runat="server" SelectedDate='<%# Bind("DataInicio") %>'></asp:Calendar>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("DataInicio","{0:dd-M-yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DataFim" SortExpression="DataFim">
                    <EditItemTemplate>
                        <asp:Calendar ID="Calendar3" runat="server" SelectedDate='<%# Bind("DataFim") %>' ></asp:Calendar>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:Calendar ID="Calendar5" runat="server" SelectedDate='<%# Bind("DataFim") %>'></asp:Calendar>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("DataFim","{0:dd-M-yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="TipoEvento" SortExpression="TipoEvento">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourceDDTipoEvento" DataTextField="Descricao" DataValueField="Codigo" SelectedValue='<%# Bind("TipoEvento") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSourceDDTipoEvento" DataTextField="Descricao" DataValueField="Codigo" SelectedValue='<%# 
("TipoEvento") %>'>
                        </asp:DropDownList>
                        
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("DesTipoEvento") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DataHora" SortExpression="DataHora">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox22" runat="server" Text='<%# Bind("DataHora") %>' ReadOnly="True"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("DataHora","{0:dd-M-yyyy}") %>' ViewStateMode="Disabled" Visible="False"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:sistemaConnectionString %>" 
            SelectCommand="SELECT * FROM [View_Evento] WHERE ([Codigo] = @Codigo)" DeleteCommand="EventoD" DeleteCommandType="StoredProcedure" InsertCommand="EventoIU" InsertCommandType="StoredProcedure" UpdateCommand="EventoIU" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="Codigo" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Descricao" Type="String" />
                <asp:Parameter DbType="Date" Name="DataHora" />
                <asp:Parameter DbType="Date" Name="DataInicio" />
                <asp:Parameter DbType="Date" Name="DataFim" />
                <asp:Parameter Name="TipoEvento" Type="Int32" />
                <asp:Parameter Name="DesTipoEvento" Type="String" />
                <asp:Parameter Name="retVar" Type="Boolean" DefaultValue=true/>
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="Codigo" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Codigo" Type="Int32" />
                <asp:Parameter Name="Descricao" Type="String" />
                <asp:Parameter DbType="Date" Name="DataHora" />
                <asp:Parameter DbType="Date" Name="DataInicio" />
                <asp:Parameter DbType="Date" Name="DataFim" />
                <asp:Parameter Name="TipoEvento" Type="Int32" />
                <asp:Parameter Name="DesTipoEvento" Type="String" />
                <asp:Parameter Name="retVar" Type="Boolean" DefaultValue=false/>
            </UpdateParameters>
        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSourceDDTipoEvento" runat="server" ConnectionString="<%$ ConnectionStrings:sistemaConnectionString %>" SelectCommand="SELECT * FROM [TipoEvento] ORDER BY [Descricao]"></asp:SqlDataSource>
    </div>
</asp:Content>
