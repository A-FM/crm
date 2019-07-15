var navs = [{
	"title": "客户管理",
	"icon": "fa-cubes",
	"spread": false,
	"children": [{
		"title": "新增客户",
		"icon": "&#xe63c;",
		"href": "ToAddServlet"
	}, {
		"title": "客户列表",
		"icon": "&#xe63c;",
		"href": "SelectAllCust"
	}, {
		"title": "分页客户列表",
		"icon": "&#xe63c;",
		"href": "PageLimitServlet?currentPage=1"
	}]
}, {
	"title": "联系人管理",
	"icon": "fa-cubes",
	"spread": false,
	"children": [{
		"title": "新增联系人",
		"icon": "&#xe63c;",
		"href": "LinkManServlet?control=toadd"
	}, {
		"title": "联系人列表",
		"icon": "&#xe63c;",
		"href": "LinkManServlet?control=list"
	}]
}, {
	"title": "客户拜访管理",
	"icon": "fa-cubes",
	"spread": false,
	"children": [{
		"title": "新增客户拜访记录",
		"icon": "&#xe63c;",
		"href": "VisitServlet?control=toAddVisit"
	},{
		"title": "拜访记录列表",
		"icon": "&#xe63c;",
		"href": "VisitServlet?control=listAll"
	}]
}, {
	"title": "综合查询",
	"icon": "fa-cubes",
	"spread": false,
	"children": [{
		"title": "客户信息查询",
		"icon": "&#xe63c;",
		"href": "CustServlet?control=toDynamicQuery"
	}, {
		"title": "联系人信息查询",
		"icon": "&#xe63c;",
		"href": "LinkManServlet?control=toDynamicQuery"
	}, {
		"title": "拜访记录信息查询",
		"icon": "&#xe63c;",
		"href": "VisitServlet?control=toDynamicQuery"
	}]
},{
	"title": "统计查询",
	"icon": "fa-cubes",
	"spread": false,
	"children": [{
		"title": "客户来源统计",
		"icon": "&#xe63c;",
		"href": "CustServlet?control=statistics"
	}, {
		"title": "客户级别统计",
		"icon": "&#xe63c;",
		"href": "CustServlet?control=statisticsLevel"
	}]
},
{
	"title": "系统管理",
	"icon": "fa-cubes",
	"href": "systemManager",
	"spread": false
}];