﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:2.0.50727.8000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Alumni
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.Data;
	using System.Collections.Generic;
	using System.Reflection;
	using System.Linq;
	using System.Linq.Expressions;
	
	
	[System.Data.Linq.Mapping.DatabaseAttribute(Name="Database")]
	public partial class DBDataContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		
    #region Extensibility Method Definitions
    partial void OnCreated();
    partial void InsertUsers(Database.Users instance);
    partial void UpdateUsers(Database.Users instance);
    partial void DeleteUsers(Database.Users instance);
    partial void InsertColumns(Database.Columns instance);
    partial void UpdateColumns(Database.Columns instance);
    partial void DeleteColumns(Database.Columns instance);
    partial void InsertLinks(Database.Links instance);
    partial void UpdateLinks(Database.Links instance);
    partial void DeleteLinks(Database.Links instance);
    partial void InsertTemplates(Database.Templates instance);
    partial void UpdateTemplates(Database.Templates instance);
    partial void DeleteTemplates(Database.Templates instance);
    partial void InsertArticles(Database.Articles instance);
    partial void UpdateArticles(Database.Articles instance);
    partial void DeleteArticles(Database.Articles instance);
    #endregion
		
		public DBDataContext() : 
				base(global::System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString, mappingSource)
		{
			OnCreated();
		}
		
		public DBDataContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public DBDataContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public DBDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public DBDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public System.Data.Linq.Table<Database.Users> Users
		{
			get
			{
				return this.GetTable<Database.Users>();
			}
		}
		
		public System.Data.Linq.Table<Database.Columns> Columns
		{
			get
			{
				return this.GetTable<Database.Columns>();
			}
		}
		
		public System.Data.Linq.Table<Database.Donations> Donations
		{
			get
			{
				return this.GetTable<Database.Donations>();
			}
		}
		
		public System.Data.Linq.Table<Database.Links> Links
		{
			get
			{
				return this.GetTable<Database.Links>();
			}
		}
		
		public System.Data.Linq.Table<Database.Templates> Templates
		{
			get
			{
				return this.GetTable<Database.Templates>();
			}
		}
		
		public System.Data.Linq.Table<Database.Configs> Configs
		{
			get
			{
				return this.GetTable<Database.Configs>();
			}
		}
		
		public System.Data.Linq.Table<Database.Articles> Articles
		{
			get
			{
				return this.GetTable<Database.Articles>();
			}
		}
	}
}
namespace Database
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.ComponentModel;
	using System;
	
	
	[Table(Name="dbo.Users")]
	public partial class Users : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _UserID;
		
		private string _UserName;
		
		private string _PassWord;
		
		private int _Level;
		
		private EntitySet<Articles> _Articles;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnUserIDChanging(int value);
    partial void OnUserIDChanged();
    partial void OnUserNameChanging(string value);
    partial void OnUserNameChanged();
    partial void OnPassWordChanging(string value);
    partial void OnPassWordChanged();
    partial void OnLevelChanging(int value);
    partial void OnLevelChanged();
    #endregion
		
		public Users()
		{
			this._Articles = new EntitySet<Articles>(new Action<Articles>(this.attach_Articles), new Action<Articles>(this.detach_Articles));
			OnCreated();
		}
		
		[Column(Storage="_UserID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int UserID
		{
			get
			{
				return this._UserID;
			}
			set
			{
				if ((this._UserID != value))
				{
					this.OnUserIDChanging(value);
					this.SendPropertyChanging();
					this._UserID = value;
					this.SendPropertyChanged("UserID");
					this.OnUserIDChanged();
				}
			}
		}
		
		[Column(Storage="_UserName", DbType="NVarChar(MAX) NOT NULL", CanBeNull=false)]
		public string UserName
		{
			get
			{
				return this._UserName;
			}
			set
			{
				if ((this._UserName != value))
				{
					this.OnUserNameChanging(value);
					this.SendPropertyChanging();
					this._UserName = value;
					this.SendPropertyChanged("UserName");
					this.OnUserNameChanged();
				}
			}
		}
		
		[Column(Storage="_PassWord", DbType="NVarChar(MAX) NOT NULL", CanBeNull=false)]
		public string PassWord
		{
			get
			{
				return this._PassWord;
			}
			set
			{
				if ((this._PassWord != value))
				{
					this.OnPassWordChanging(value);
					this.SendPropertyChanging();
					this._PassWord = value;
					this.SendPropertyChanged("PassWord");
					this.OnPassWordChanged();
				}
			}
		}
		
		[Column(Name="[Level]", Storage="_Level", DbType="Int NOT NULL")]
		public int Level
		{
			get
			{
				return this._Level;
			}
			set
			{
				if ((this._Level != value))
				{
					this.OnLevelChanging(value);
					this.SendPropertyChanging();
					this._Level = value;
					this.SendPropertyChanged("Level");
					this.OnLevelChanged();
				}
			}
		}
		
		[Association(Name="Users_Articles", Storage="_Articles", ThisKey="UserID", OtherKey="PublishUserID")]
		public EntitySet<Articles> Articles
		{
			get
			{
				return this._Articles;
			}
			set
			{
				this._Articles.Assign(value);
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
		
		private void attach_Articles(Articles entity)
		{
			this.SendPropertyChanging();
			entity.Users = this;
		}
		
		private void detach_Articles(Articles entity)
		{
			this.SendPropertyChanging();
			entity.Users = null;
		}
	}
	
	[Table(Name="dbo.Columns")]
	public partial class Columns : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _ColumnID;
		
		private int _ParentColumnID;
		
		private int _SubTemplateID;
		
		private string _ColumnName;
		
		private bool _IsExternalLink;
		
		private string _ExternalLinkURL;
		
		private EntitySet<Articles> _Articles;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnColumnIDChanging(int value);
    partial void OnColumnIDChanged();
    partial void OnParentColumnIDChanging(int value);
    partial void OnParentColumnIDChanged();
    partial void OnSubTemplateIDChanging(int value);
    partial void OnSubTemplateIDChanged();
    partial void OnColumnNameChanging(string value);
    partial void OnColumnNameChanged();
    partial void OnIsExternalLinkChanging(bool value);
    partial void OnIsExternalLinkChanged();
    partial void OnExternalLinkURLChanging(string value);
    partial void OnExternalLinkURLChanged();
    #endregion
		
		public Columns()
		{
			this._Articles = new EntitySet<Articles>(new Action<Articles>(this.attach_Articles), new Action<Articles>(this.detach_Articles));
			OnCreated();
		}
		
		[Column(Storage="_ColumnID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int ColumnID
		{
			get
			{
				return this._ColumnID;
			}
			set
			{
				if ((this._ColumnID != value))
				{
					this.OnColumnIDChanging(value);
					this.SendPropertyChanging();
					this._ColumnID = value;
					this.SendPropertyChanged("ColumnID");
					this.OnColumnIDChanged();
				}
			}
		}
		
		[Column(Storage="_ParentColumnID", DbType="Int NOT NULL")]
		public int ParentColumnID
		{
			get
			{
				return this._ParentColumnID;
			}
			set
			{
				if ((this._ParentColumnID != value))
				{
					this.OnParentColumnIDChanging(value);
					this.SendPropertyChanging();
					this._ParentColumnID = value;
					this.SendPropertyChanged("ParentColumnID");
					this.OnParentColumnIDChanged();
				}
			}
		}
		
		[Column(Storage="_SubTemplateID", DbType="Int NOT NULL")]
		public int SubTemplateID
		{
			get
			{
				return this._SubTemplateID;
			}
			set
			{
				if ((this._SubTemplateID != value))
				{
					this.OnSubTemplateIDChanging(value);
					this.SendPropertyChanging();
					this._SubTemplateID = value;
					this.SendPropertyChanged("SubTemplateID");
					this.OnSubTemplateIDChanged();
				}
			}
		}
		
		[Column(Storage="_ColumnName", DbType="NVarChar(MAX) NOT NULL", CanBeNull=false)]
		public string ColumnName
		{
			get
			{
				return this._ColumnName;
			}
			set
			{
				if ((this._ColumnName != value))
				{
					this.OnColumnNameChanging(value);
					this.SendPropertyChanging();
					this._ColumnName = value;
					this.SendPropertyChanged("ColumnName");
					this.OnColumnNameChanged();
				}
			}
		}
		
		[Column(Storage="_IsExternalLink", DbType="Bit NOT NULL")]
		public bool IsExternalLink
		{
			get
			{
				return this._IsExternalLink;
			}
			set
			{
				if ((this._IsExternalLink != value))
				{
					this.OnIsExternalLinkChanging(value);
					this.SendPropertyChanging();
					this._IsExternalLink = value;
					this.SendPropertyChanged("IsExternalLink");
					this.OnIsExternalLinkChanged();
				}
			}
		}
		
		[Column(Storage="_ExternalLinkURL", DbType="NVarChar(MAX)")]
		public string ExternalLinkURL
		{
			get
			{
				return this._ExternalLinkURL;
			}
			set
			{
				if ((this._ExternalLinkURL != value))
				{
					this.OnExternalLinkURLChanging(value);
					this.SendPropertyChanging();
					this._ExternalLinkURL = value;
					this.SendPropertyChanged("ExternalLinkURL");
					this.OnExternalLinkURLChanged();
				}
			}
		}
		
		[Association(Name="Columns_Articles", Storage="_Articles", ThisKey="ColumnID", OtherKey="ColumnID")]
		public EntitySet<Articles> Articles
		{
			get
			{
				return this._Articles;
			}
			set
			{
				this._Articles.Assign(value);
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
		
		private void attach_Articles(Articles entity)
		{
			this.SendPropertyChanging();
			entity.Columns = this;
		}
		
		private void detach_Articles(Articles entity)
		{
			this.SendPropertyChanging();
			entity.Columns = null;
		}
	}
	
	[Table(Name="dbo.Donations")]
	public partial class Donations
	{
		
		private int _DonationId;
		
		private string _Name;
		
		private string _Amount;
		
		public Donations()
		{
		}
		
		[Column(Storage="_DonationId", AutoSync=AutoSync.Always, DbType="Int NOT NULL IDENTITY", IsDbGenerated=true)]
		public int DonationId
		{
			get
			{
				return this._DonationId;
			}
			set
			{
				if ((this._DonationId != value))
				{
					this._DonationId = value;
				}
			}
		}
		
		[Column(Storage="_Name", DbType="NVarChar(MAX) NOT NULL", CanBeNull=false)]
		public string Name
		{
			get
			{
				return this._Name;
			}
			set
			{
				if ((this._Name != value))
				{
					this._Name = value;
				}
			}
		}
		
		[Column(Storage="_Amount", DbType="NVarChar(MAX) NOT NULL", CanBeNull=false)]
		public string Amount
		{
			get
			{
				return this._Amount;
			}
			set
			{
				if ((this._Amount != value))
				{
					this._Amount = value;
				}
			}
		}
	}
	
	[Table(Name="dbo.Links")]
	public partial class Links : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _LinkID;
		
		private string _LinkName;
		
		private string _LinkURL;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnLinkIDChanging(int value);
    partial void OnLinkIDChanged();
    partial void OnLinkNameChanging(string value);
    partial void OnLinkNameChanged();
    partial void OnLinkURLChanging(string value);
    partial void OnLinkURLChanged();
    #endregion
		
		public Links()
		{
			OnCreated();
		}
		
		[Column(Storage="_LinkID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int LinkID
		{
			get
			{
				return this._LinkID;
			}
			set
			{
				if ((this._LinkID != value))
				{
					this.OnLinkIDChanging(value);
					this.SendPropertyChanging();
					this._LinkID = value;
					this.SendPropertyChanged("LinkID");
					this.OnLinkIDChanged();
				}
			}
		}
		
		[Column(Storage="_LinkName", DbType="NVarChar(MAX) NOT NULL", CanBeNull=false)]
		public string LinkName
		{
			get
			{
				return this._LinkName;
			}
			set
			{
				if ((this._LinkName != value))
				{
					this.OnLinkNameChanging(value);
					this.SendPropertyChanging();
					this._LinkName = value;
					this.SendPropertyChanged("LinkName");
					this.OnLinkNameChanged();
				}
			}
		}
		
		[Column(Storage="_LinkURL", DbType="NVarChar(MAX) NOT NULL", CanBeNull=false)]
		public string LinkURL
		{
			get
			{
				return this._LinkURL;
			}
			set
			{
				if ((this._LinkURL != value))
				{
					this.OnLinkURLChanging(value);
					this.SendPropertyChanging();
					this._LinkURL = value;
					this.SendPropertyChanged("LinkURL");
					this.OnLinkURLChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[Table(Name="dbo.Templates")]
	public partial class Templates : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _TemplateID;
		
		private int _ParentTemplateID;
		
		private int _SubTemplateID;
		
		private string _TemplateName;
		
		private string _TemplatePath;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnTemplateIDChanging(int value);
    partial void OnTemplateIDChanged();
    partial void OnParentTemplateIDChanging(int value);
    partial void OnParentTemplateIDChanged();
    partial void OnSubTemplateIDChanging(int value);
    partial void OnSubTemplateIDChanged();
    partial void OnTemplateNameChanging(string value);
    partial void OnTemplateNameChanged();
    partial void OnTemplatePathChanging(string value);
    partial void OnTemplatePathChanged();
    #endregion
		
		public Templates()
		{
			OnCreated();
		}
		
		[Column(Storage="_TemplateID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int TemplateID
		{
			get
			{
				return this._TemplateID;
			}
			set
			{
				if ((this._TemplateID != value))
				{
					this.OnTemplateIDChanging(value);
					this.SendPropertyChanging();
					this._TemplateID = value;
					this.SendPropertyChanged("TemplateID");
					this.OnTemplateIDChanged();
				}
			}
		}
		
		[Column(Storage="_ParentTemplateID", DbType="Int NOT NULL")]
		public int ParentTemplateID
		{
			get
			{
				return this._ParentTemplateID;
			}
			set
			{
				if ((this._ParentTemplateID != value))
				{
					this.OnParentTemplateIDChanging(value);
					this.SendPropertyChanging();
					this._ParentTemplateID = value;
					this.SendPropertyChanged("ParentTemplateID");
					this.OnParentTemplateIDChanged();
				}
			}
		}
		
		[Column(Storage="_SubTemplateID", DbType="Int NOT NULL")]
		public int SubTemplateID
		{
			get
			{
				return this._SubTemplateID;
			}
			set
			{
				if ((this._SubTemplateID != value))
				{
					this.OnSubTemplateIDChanging(value);
					this.SendPropertyChanging();
					this._SubTemplateID = value;
					this.SendPropertyChanged("SubTemplateID");
					this.OnSubTemplateIDChanged();
				}
			}
		}
		
		[Column(Storage="_TemplateName", DbType="NVarChar(MAX) NOT NULL", CanBeNull=false)]
		public string TemplateName
		{
			get
			{
				return this._TemplateName;
			}
			set
			{
				if ((this._TemplateName != value))
				{
					this.OnTemplateNameChanging(value);
					this.SendPropertyChanging();
					this._TemplateName = value;
					this.SendPropertyChanged("TemplateName");
					this.OnTemplateNameChanged();
				}
			}
		}
		
		[Column(Storage="_TemplatePath", DbType="NVarChar(MAX) NOT NULL", CanBeNull=false)]
		public string TemplatePath
		{
			get
			{
				return this._TemplatePath;
			}
			set
			{
				if ((this._TemplatePath != value))
				{
					this.OnTemplatePathChanging(value);
					this.SendPropertyChanging();
					this._TemplatePath = value;
					this.SendPropertyChanged("TemplatePath");
					this.OnTemplatePathChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[Table(Name="dbo.Configs")]
	public partial class Configs
	{
		
		private int _GlobalTemplateID;
		
		private int _ArticlesPerPage;
		
		public Configs()
		{
		}
		
		[Column(Storage="_GlobalTemplateID", DbType="Int NOT NULL")]
		public int GlobalTemplateID
		{
			get
			{
				return this._GlobalTemplateID;
			}
			set
			{
				if ((this._GlobalTemplateID != value))
				{
					this._GlobalTemplateID = value;
				}
			}
		}
		
		[Column(Storage="_ArticlesPerPage", DbType="Int NOT NULL")]
		public int ArticlesPerPage
		{
			get
			{
				return this._ArticlesPerPage;
			}
			set
			{
				if ((this._ArticlesPerPage != value))
				{
					this._ArticlesPerPage = value;
				}
			}
		}
	}
	
	[Table(Name="dbo.Articles")]
	public partial class Articles : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _ArticleID;
		
		private int _ColumnID;
		
		private int _SubTemplateID;
		
		private int _PublishUserID;
		
		private System.DateTime _PublishDate;
		
		private int _VisitCount;
		
		private bool _IsStickTop;
		
		private string _Title;
		
		private string _PictureURL;
		
		private string _Keywords;
		
		private string _Source;
		
		private string _Content;
		
		private EntityRef<Columns> _Columns;
		
		private EntityRef<Users> _Users;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnArticleIDChanging(int value);
    partial void OnArticleIDChanged();
    partial void OnColumnIDChanging(int value);
    partial void OnColumnIDChanged();
    partial void OnSubTemplateIDChanging(int value);
    partial void OnSubTemplateIDChanged();
    partial void OnPublishUserIDChanging(int value);
    partial void OnPublishUserIDChanged();
    partial void OnPublishDateChanging(System.DateTime value);
    partial void OnPublishDateChanged();
    partial void OnVisitCountChanging(int value);
    partial void OnVisitCountChanged();
    partial void OnIsStickTopChanging(bool value);
    partial void OnIsStickTopChanged();
    partial void OnTitleChanging(string value);
    partial void OnTitleChanged();
    partial void OnPictureURLChanging(string value);
    partial void OnPictureURLChanged();
    partial void OnKeywordsChanging(string value);
    partial void OnKeywordsChanged();
    partial void OnSourceChanging(string value);
    partial void OnSourceChanged();
    partial void OnContentChanging(string value);
    partial void OnContentChanged();
    #endregion
		
		public Articles()
		{
			this._Columns = default(EntityRef<Columns>);
			this._Users = default(EntityRef<Users>);
			OnCreated();
		}
		
		[Column(Storage="_ArticleID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int ArticleID
		{
			get
			{
				return this._ArticleID;
			}
			set
			{
				if ((this._ArticleID != value))
				{
					this.OnArticleIDChanging(value);
					this.SendPropertyChanging();
					this._ArticleID = value;
					this.SendPropertyChanged("ArticleID");
					this.OnArticleIDChanged();
				}
			}
		}
		
		[Column(Storage="_ColumnID", DbType="Int NOT NULL")]
		public int ColumnID
		{
			get
			{
				return this._ColumnID;
			}
			set
			{
				if ((this._ColumnID != value))
				{
					if (this._Columns.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.OnColumnIDChanging(value);
					this.SendPropertyChanging();
					this._ColumnID = value;
					this.SendPropertyChanged("ColumnID");
					this.OnColumnIDChanged();
				}
			}
		}
		
		[Column(Storage="_SubTemplateID", DbType="Int NOT NULL")]
		public int SubTemplateID
		{
			get
			{
				return this._SubTemplateID;
			}
			set
			{
				if ((this._SubTemplateID != value))
				{
					this.OnSubTemplateIDChanging(value);
					this.SendPropertyChanging();
					this._SubTemplateID = value;
					this.SendPropertyChanged("SubTemplateID");
					this.OnSubTemplateIDChanged();
				}
			}
		}
		
		[Column(Storage="_PublishUserID", DbType="Int NOT NULL")]
		public int PublishUserID
		{
			get
			{
				return this._PublishUserID;
			}
			set
			{
				if ((this._PublishUserID != value))
				{
					if (this._Users.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.OnPublishUserIDChanging(value);
					this.SendPropertyChanging();
					this._PublishUserID = value;
					this.SendPropertyChanged("PublishUserID");
					this.OnPublishUserIDChanged();
				}
			}
		}
		
		[Column(Storage="_PublishDate", DbType="DateTime NOT NULL")]
		public System.DateTime PublishDate
		{
			get
			{
				return this._PublishDate;
			}
			set
			{
				if ((this._PublishDate != value))
				{
					this.OnPublishDateChanging(value);
					this.SendPropertyChanging();
					this._PublishDate = value;
					this.SendPropertyChanged("PublishDate");
					this.OnPublishDateChanged();
				}
			}
		}
		
		[Column(Storage="_VisitCount", DbType="Int NOT NULL")]
		public int VisitCount
		{
			get
			{
				return this._VisitCount;
			}
			set
			{
				if ((this._VisitCount != value))
				{
					this.OnVisitCountChanging(value);
					this.SendPropertyChanging();
					this._VisitCount = value;
					this.SendPropertyChanged("VisitCount");
					this.OnVisitCountChanged();
				}
			}
		}
		
		[Column(Storage="_IsStickTop", DbType="Bit NOT NULL")]
		public bool IsStickTop
		{
			get
			{
				return this._IsStickTop;
			}
			set
			{
				if ((this._IsStickTop != value))
				{
					this.OnIsStickTopChanging(value);
					this.SendPropertyChanging();
					this._IsStickTop = value;
					this.SendPropertyChanged("IsStickTop");
					this.OnIsStickTopChanged();
				}
			}
		}
		
		[Column(Storage="_Title", DbType="NVarChar(MAX) NOT NULL", CanBeNull=false)]
		public string Title
		{
			get
			{
				return this._Title;
			}
			set
			{
				if ((this._Title != value))
				{
					this.OnTitleChanging(value);
					this.SendPropertyChanging();
					this._Title = value;
					this.SendPropertyChanged("Title");
					this.OnTitleChanged();
				}
			}
		}
		
		[Column(Storage="_PictureURL", DbType="NVarChar(MAX)")]
		public string PictureURL
		{
			get
			{
				return this._PictureURL;
			}
			set
			{
				if ((this._PictureURL != value))
				{
					this.OnPictureURLChanging(value);
					this.SendPropertyChanging();
					this._PictureURL = value;
					this.SendPropertyChanged("PictureURL");
					this.OnPictureURLChanged();
				}
			}
		}
		
		[Column(Storage="_Keywords", DbType="NVarChar(MAX) NOT NULL", CanBeNull=false)]
		public string Keywords
		{
			get
			{
				return this._Keywords;
			}
			set
			{
				if ((this._Keywords != value))
				{
					this.OnKeywordsChanging(value);
					this.SendPropertyChanging();
					this._Keywords = value;
					this.SendPropertyChanged("Keywords");
					this.OnKeywordsChanged();
				}
			}
		}
		
		[Column(Storage="_Source", DbType="NVarChar(MAX) NOT NULL", CanBeNull=false)]
		public string Source
		{
			get
			{
				return this._Source;
			}
			set
			{
				if ((this._Source != value))
				{
					this.OnSourceChanging(value);
					this.SendPropertyChanging();
					this._Source = value;
					this.SendPropertyChanged("Source");
					this.OnSourceChanged();
				}
			}
		}
		
		[Column(Storage="_Content", DbType="NVarChar(MAX) NOT NULL", CanBeNull=false)]
		public string Content
		{
			get
			{
				return this._Content;
			}
			set
			{
				if ((this._Content != value))
				{
					this.OnContentChanging(value);
					this.SendPropertyChanging();
					this._Content = value;
					this.SendPropertyChanged("Content");
					this.OnContentChanged();
				}
			}
		}
		
		[Association(Name="Columns_Articles", Storage="_Columns", ThisKey="ColumnID", OtherKey="ColumnID", IsForeignKey=true)]
		public Columns Columns
		{
			get
			{
				return this._Columns.Entity;
			}
			set
			{
				Columns previousValue = this._Columns.Entity;
				if (((previousValue != value) 
							|| (this._Columns.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._Columns.Entity = null;
						previousValue.Articles.Remove(this);
					}
					this._Columns.Entity = value;
					if ((value != null))
					{
						value.Articles.Add(this);
						this._ColumnID = value.ColumnID;
					}
					else
					{
						this._ColumnID = default(int);
					}
					this.SendPropertyChanged("Columns");
				}
			}
		}
		
		[Association(Name="Users_Articles", Storage="_Users", ThisKey="PublishUserID", OtherKey="UserID", IsForeignKey=true)]
		public Users Users
		{
			get
			{
				return this._Users.Entity;
			}
			set
			{
				Users previousValue = this._Users.Entity;
				if (((previousValue != value) 
							|| (this._Users.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._Users.Entity = null;
						previousValue.Articles.Remove(this);
					}
					this._Users.Entity = value;
					if ((value != null))
					{
						value.Articles.Add(this);
						this._PublishUserID = value.UserID;
					}
					else
					{
						this._PublishUserID = default(int);
					}
					this.SendPropertyChanged("Users");
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
}
#pragma warning restore 1591
