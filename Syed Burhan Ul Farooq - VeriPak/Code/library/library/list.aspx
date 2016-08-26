<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="list.aspx.cs" Inherits="library.list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True"
        AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%"
        CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText=" " ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:RadioButton ID="RowSelector" runat="server" onclick="checkRadioBtn(this);" OnCheckedChanged="RowSelector_CheckedChanged" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
            <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
            <asp:BoundField DataField="isbn" HeaderText="ISBN" SortExpression="isbn" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
            <asp:BoundField DataField="publish_year" HeaderText="Publish Year" SortExpression="publish_year" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
            <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" DataFormatString="{0:N2}" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" />

            <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Image ID="Image1" Height="100" Width="100" runat="server" ImageUrl='<%# Eval("cover_picture") %>' />
                </ItemTemplate>
            </asp:TemplateField>
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
    <asp:HiddenField ID="hfBookId" runat="server" />
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
    <asp:Button ID="btncheckin" runat="server" OnClick="btncheckin_Click"
        Text="Check-In" />
    <asp:Button ID="btncheckout" runat="server" OnClick="btncheckout_Click"
        Text="Check-Out" />
    <asp:Button ID="btndetails" runat="server" OnClick="btndetails_Click"
        Text="Details" />




    <script type="text/javascript">
        function checkRadioBtn(id) {

            var gv = document.getElementById('<%=GridView1.ClientID %>');
            for (var i = 1; i < gv.rows.length; i++) {
                var radioBtn = gv.rows[i].cells[0].getElementsByTagName("input");
                
                // Check if the id not same
                if (radioBtn[0].id != id.id) {
                    radioBtn[0].checked = false;
                    if (isOdd(i)) {
                        gv.rows[i].style.backgroundColor = '#F7F6F3';
                    }
                    else {
                        gv.rows[i].style.backgroundColor = 'White';
                    }
                }
                else {
                    gv.rows[i].style.backgroundColor = '#E2DED6';
                    var ID = gv.rows[i].cells[1].innerText;
                    var hf = document.getElementById('<%=hfBookId.ClientID %>');
                    hf.value = ID;
                }
            }

        }
        function isOdd(num) { return num % 2; }
    </script>

</asp:Content>
