<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="list.aspx.cs" Inherits="library.list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True"
        AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%" 
        CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
         <%--<asp:TemplateField>

<ItemTemplate>

    <asp:RadioButton ID="RadioButton1" runat="server"

        GroupName="same" 
        oncheckedchanged="RadioButton1_CheckedChanged"/>

    <asp:HiddenField ID="HiddenField1" runat="server"

        Value = '<%#Eval("id")%>' />

</ItemTemplate>

</asp:TemplateField>--%>            
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                SortExpression="id" />
            <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            <asp:BoundField DataField="isbn" HeaderText="isbn" SortExpression="isbn" />
            <asp:BoundField DataField="publish_year" HeaderText="publish_year" SortExpression="publish_year" />
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
            <%--<asp:BoundField DataField="cover_picture" HeaderText="cover_picture" SortExpression="cover_picture" />--%>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Image ID="Image1" Height="100" Width="100" runat="server" ImageUrl='<%# Eval("cover_picture") %>' />
                    </ItemTemplate> </asp:TemplateField>
                    <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
        SelectCommand="SELECT * FROM [books]"></asp:SqlDataSource>

        

<br />



<%--<asp:TemplateField>

<ItemTemplate>

    <asp:RadioButton ID="RadioButton1" runat="server"

        GroupName="same" 
        oncheckedchanged="RadioButton1_CheckedChanged"/>

    <asp:HiddenField ID="HiddenField1" runat="server"

        Value = '<%#Eval("id")%>' />

</ItemTemplate>

</asp:TemplateField>--%>
    <asp:Button ID="btncheckin" runat="server" onclick="btncheckin_Click" 
        Text="Check-In" />
    <asp:Button ID="btncheckout" runat="server" onclick="btncheckout_Click" 
        Text="Check-Out" />
    <asp:Button ID="btndetails" runat="server" onclick="btndetails_Click" 
        Text="Details" />

</asp:Content>
