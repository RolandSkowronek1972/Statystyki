<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="Statystyki_2018.test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="Scripts/jquery-1.8.3.js"></script>
    <script src="Scripts/rls.js"></script>

    <script type="text/javascript">
        window.onload = function () {
              var request = new XMLHttpRequest();
        request.open("GET", "time.txt", false);
        request.send(null);
        var returnValue = request.responseText;

      
            alert(returnValue);
        }
    </script>

    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
    <br />
    <br />

    <div id='tab2'>

        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="sprawdzenie plików" />
        <br />
        <br />
        <asp:Label ID="Label2" runat="server"></asp:Label>
        <br />
        <asp:Label ID="Label3" runat="server"></asp:Label>
        <br />
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Button" />
        <asp:TextBox ID="TextBox2" runat="server" Width="665px"></asp:TextBox>
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Height="160px" TextMode="MultiLine" Width="1012px"></asp:TextBox>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="ident" HeaderText="ident" SortExpression="ident" />
                <asp:BoundField DataField="nazwa" HeaderText="nazwa" SortExpression="nazwa" />
                <asp:BoundField DataField="rodzaj" HeaderText="rodzaj" SortExpression="rodzaj" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SatystykiConnectionString2 %>" SelectCommand="SELECT * FROM [funkcje]"></asp:SqlDataSource>
        <br />
        <asp:Label ID="kod011" runat="server"></asp:Label>
        <asp:PlaceHolder runat="server" ID="tablePlaceHolder"></asp:PlaceHolder>
        <br />
    </div>
</asp:Content>