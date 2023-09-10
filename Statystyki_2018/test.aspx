<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="Statystyki_2018.test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <br />
    <br />

    <script src="Scripts/jquery-1.8.3.js"></script>
    <script src="Scripts/rls.js"></script>

    <script type="text/javascript">
        window.onload = function () {
              var request = new XMLHttpRequest();
        request.open("GET", "time.txt", false);
        request.send(null);
        var returnValue = request.responseText;

      
         //   alert(returnValue);
        }
    </script>

    <asp:TextBox ID="TextBox1" runat="server" Height="94px" Width="280px"></asp:TextBox>
    <br />
    <br />
    <br />

    <asp:Button ID="Notatnik" runat="server" OnClick="Button1_Click" Text="Button" />
    <br />
    <br />

    </asp:Content>