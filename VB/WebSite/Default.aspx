<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v13.2, Version=13.2.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>CRUD operations in ASPxTreeList using hyperlinks in a custom column</title>
</head>
<body>
	<form id="form1" runat="server">
		<div>
			<dx:ASPxTreeList ID="Tree" ClientInstanceName="Tree" runat="server" AutoGenerateColumns="False" DataSourceID="Source" KeyFieldName="CategoryID">
				<Columns>
					<dx:TreeListTextColumn FieldName="CategoryName" VisibleIndex="0">
					</dx:TreeListTextColumn>
					<dx:TreeListTextColumn FieldName="Description" VisibleIndex="1">
					</dx:TreeListTextColumn>
					<dx:TreeListDataColumn FieldName="Buttons" VisibleIndex="2" ReadOnly="true">
						<DataCellTemplate>
							<a href="javascript:Tree.StartEditNewNode()">New</a>
							<a href="javascript:Tree.StartEdit('<%#Container.NodeKey%>')">Edit</a>
							<a href="javascript:Tree.DeleteNode('<%#Container.NodeKey%>')">Delete</a>
						</DataCellTemplate>
						<EditFormSettings Visible="False" />
					</dx:TreeListDataColumn>
					<dx:TreeListCommandColumn VisibleIndex="3" Visible="false">
					</dx:TreeListCommandColumn>
				</Columns>
				<SettingsEditing Mode="EditForm" />
			</dx:ASPxTreeList>
			<asp:SqlDataSource ID="Source" runat="server"
				ConnectionString="<%$ ConnectionStrings:NwindConnectionString %>"
				SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]"
				DeleteCommand="DELETE FROM [Categories] WHERE [CategoryID] = @CategoryID"
				InsertCommand="INSERT INTO [Categories] ([CategoryID], [CategoryName], [Description]) VALUES (@CategoryID, @CategoryName, @Description)"
				UpdateCommand="UPDATE [Categories] SET [CategoryName] = @CategoryName, [Description] = @Description WHERE [CategoryID] = @CategoryID">
				<DeleteParameters>
					<asp:Parameter Name="CategoryID" Type="Int32" />
				</DeleteParameters>
				<InsertParameters>
					<asp:Parameter Name="CategoryID" Type="Int32" />
					<asp:Parameter Name="CategoryName" Type="String" />
					<asp:Parameter Name="Description" Type="String" />
				</InsertParameters>
				<UpdateParameters>
					<asp:Parameter Name="CategoryName" Type="String" />
					<asp:Parameter Name="Description" Type="String" />
					<asp:Parameter Name="CategoryID" Type="Int32" />
				</UpdateParameters>
			</asp:SqlDataSource>
		</div>
	</form>
</body>
</html>