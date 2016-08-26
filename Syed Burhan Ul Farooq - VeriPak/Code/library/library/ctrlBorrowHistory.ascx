<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctrlBorrowHistory.ascx.cs" Inherits="library.ctrlBorrowHistory" %>
<style type="text/css">
    .auto-style1 {
        font-size: x-large;
        background-color: #FFFF66;
    }
</style>
<asp:GridView ID="GridView1" runat="server" AllowSorting="True"
        AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%"
        CellPadding="4" ForeColor="#333333" GridLines="None" style="text-align: center">
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <Columns>
        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible ="false" />
        <asp:BoundField DataField="bookid" HeaderText="bookid" SortExpression="bookid" Visible ="false"  />
        <asp:BoundField DataField="borrower" HeaderText="Borrower" SortExpression="borrower" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" >
<HeaderStyle HorizontalAlign="Left"></HeaderStyle>

<ItemStyle HorizontalAlign="Left"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="mobile" HeaderText="Mobile No." SortExpression="mobile" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" >
<HeaderStyle HorizontalAlign="Left"></HeaderStyle>

<ItemStyle HorizontalAlign="Left"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="nationalid" HeaderText="National ID" SortExpression="nationalid" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" >
<HeaderStyle HorizontalAlign="Left"></HeaderStyle>

<ItemStyle HorizontalAlign="Left"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="checkout_date" HeaderText="Checkout Date" SortExpression="checkout_date" DataFormatString="{0:f}" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"  >
<HeaderStyle HorizontalAlign="Left"></HeaderStyle>

<ItemStyle HorizontalAlign="Left"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="checkin_date" HeaderText="Checkin Date" SortExpression="checkin_date" DataFormatString="{0:f}" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" >
<HeaderStyle HorizontalAlign="Left"></HeaderStyle>

<ItemStyle HorizontalAlign="Left"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="checkin_date_return" HeaderText="Actual Return Date" SortExpression="checkin_date_return" DataFormatString="{0:f}" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" >
<HeaderStyle HorizontalAlign="Left"></HeaderStyle>

<ItemStyle HorizontalAlign="Left"></ItemStyle>
        </asp:BoundField>
    </Columns>
    <EditRowStyle BackColor="#999999" />
    <EmptyDataTemplate>
        <strong><span class="auto-style1">No History Found for this Book </span></strong>
    </EmptyDataTemplate>
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
        SelectCommand="SELECT * FROM [borrowhistory] WHERE ([bookid] = @bookid) ORDER BY [id] DESC">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="bookid" QueryStringField="bookid" Type="Int32" />
        </SelectParameters>
</asp:SqlDataSource>



    
