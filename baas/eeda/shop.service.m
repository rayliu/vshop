<?xml version="1.0" encoding="UTF-8"?>
<model>
	<action name="queryCarousel2" impl="action:common/CRUD/query">
		<private name="db" type="String">vshop</private>
		<private name="tableName" type="String">carousel</private>
		<private name="condition" type="String" />
		<private name="param9" type="String" />
		<public name="filter" type="String" />
		<public name="limit" type="Integer" />
		<public name="offset" type="Integer" />
		<public name="columns" type="String" />
		<public name="orderBy" type="String" />
		<public name="variables" type="Object" />
	</action>
	
	<action name="queryIndexGoods2" impl="action:common/CRUD/sqlQuery">
		<private name="db" type="String">vshop</private>
		<private name="sql" type="String">SELECT g.id, g.fShopID, g.fTitle,
			g.fImg, g.fPostage, g.fPrice, g.fRecord FROM index_goods ig
			left join
			goods g on ig.goods_id = g.id
		</private>
		<private name="countSql" type="String">SELECT count(1) FROM index_goods
		</private>
		<private name="tableName" type="String">goods</private>
		<public name="filter" type="String" />
		<public name="orderBy" type="String" />
		<public name="columns" type="Object" />
		<public name="limit" type="Integer" />
		<public name="offset" type="Integer" />
		<public name="variables" type="Object" />
		<public name="var-useSearch" type="Integer">0</public>
	</action>

	
	<action name="queryCartShop2" impl="action:common/CRUD/sqlQuery">
		<private name="db" type="String">vshop</private>
		<private name="sql" type="String">select * from(select sh.* from shop
			sh left join cart_goods cg on cg.fShopID = sh.id where cg.id is not
			null GROUP BY cg.fShopID) A
		</private>
		<private name="countSql" type="String">select count(*) from(select sh.*
			from shop sh left join cart_goods cg on cg.fShopID = sh.id where
			cg.id is not null GROUP BY cg.fShopID) A
		</private>
		<private name="tableName" type="String">shop</private>
		<public name="filter" type="String" />
		<public name="limit" type="Integer" />
		<public name="offset" type="Integer" />
		<public name="columns" type="String" />
		<public name="orderBy" type="String" />
		<public name="variables" type="Object" />
	</action>
	<action name="queryCartGoods2" impl="action:common/CRUD/query">
		<private name="db" type="String">vshop</private>
		<private name="tableName" type="String">cart_goods</private>
		<private name="condition" type="String" />
		<public name="filter" type="String" />
		<public name="limit" type="Integer" />
		<public name="offset" type="Integer" />
		<public name="columns" type="String" />
		<public name="orderBy" type="String" />
		<public name="variables" type="Object" />
	</action>
	<action name="queryOrderGoods" impl="action:common/CRUD/query">
		<private name="db" type="String">vshop</private>
		<private name="tableName" type="String">order_goods</private>
		<private name="condition" type="String" />
		<public name="filter" type="String" />
		<public name="limit" type="Integer" />
		<public name="offset" type="Integer" />
		<public name="columns" type="String" />
		<public name="orderBy" type="String" />
		<public name="variables" type="Object" />
	</action>
	<action name="queryOrderShop" impl="action:common/CRUD/query">
		<private name="db" type="String">vshop</private>
		<private name="tableName" type="String">order_shop</private>
		<private name="condition" type="String" />
		<public name="filter" type="String" />
		<public name="limit" type="Integer" />
		<public name="offset" type="Integer" />
		<public name="columns" type="String" />
		<public name="orderBy" type="String" />
		<public name="variables" type="Object" />
	</action>
	<action name="queryCategory9" impl="action:common/CRUD/query">
		<private name="db" type="String">vshop</private>
		<private name="tableName" type="String">category</private>
		<private name="condition" type="String" />
		<public name="filter" type="String" />
		<public name="limit" type="Integer" />
		<public name="offset" type="Integer" />
		<public name="columns" type="String" />
		<public name="orderBy" type="String" />
		<public name="variables" type="Object" />
	</action>
	<action name="queryCategoryGoods2" impl="action:common/CRUD/sqlQuery">
		<private name="db" type="String">vshop</private>
		<private name="sql" type="String">SELECT g.*, gc.category_id FROM goods
			g
			left join goods_category gc on gc.goods_id = g.id where
			gc.category_id=:category_id
		</private>
		<private name="countSql" type="String">SELECT count(1) FROM goods g
			left join goods_category gc on gc.goods_id = g.id where
			gc.category_id=:category_id
		</private>
		<private name="tableName" type="String">goods</private>
		<private name="condition" type="String" />
		<public name="filter" type="String" />
		<public name="limit" type="Integer" />
		<public name="offset" type="Integer" />
		<public name="columns" type="String" />
		<public name="orderBy" type="String">id</public>
		<public name="variables" type="Object" />
	</action>
	<action name="queryCategoryGoods" impl="action:common/CRUD/query">
		<private name="db" type="String">vshop</private>
		<private name="tableName" type="String">goods</private>
		<private name="condition" type="String" />
		<public name="filter" type="String" />
		<public name="limit" type="Integer" />
		<public name="offset" type="Integer" />
		<public name="columns" type="String" />
		<public name="orderBy" type="String">id</public>
		<public name="variables" type="Object" />
	</action>
	<action name="queryRegistUser" impl="action:common/CRUD/query">
		<private name="db" type="String">vshop</private>
		<private name="tableName" type="String">users</private>
		<private name="condition" type="String" />
		<public name="columns" type="Object" />
		<public name="filter" type="String" />
		<public name="limit" type="Integer" />
		<public name="offset" type="Integer" />
		<public name="orderBy" type="String" />
		<public name="variables" type="Object" />
	</action>
	<action name="login" impl="action:common/CRUD/query">
		<private name="db" type="String">vshop</private>
		<private name="tableName" type="String">users</private>
		<private name="condition" type="String" />
		<public name="columns" type="Object" />
		<public name="filter" type="String" />
		<public name="limit" type="Integer" />
		<public name="offset" type="Integer" />
		<public name="orderBy" type="String" />
		<public name="variables" type="Object" />
	</action>
	<action name="userRegisterPhone" impl="eeda.UserRegister.testPhone" />
	<action name="userRegisterEmail" impl="eeda.UserRegister.testEmail" />
	<action name="saveRegistUser" impl="action:common/CRUD/save">
		<private name="db" type="String">vshop</private>
		<private name="permissions" type="Object"><![CDATA[{"users":""}]]></private>
		<public name="tables" type="List" />
	</action>
	<action name="queryShopdd" impl="action:common/CRUD/query">
		<private name="db" type="String">vshop</private>
		<private name="tableName" type="String">shop</private>
		<public name="filter" type="String" />
		<public name="limit" type="Integer" />
		<public name="offset" type="Integer" />
		<public name="columns" type="String" />
		<public name="orderBy" type="String" />
		<public name="variables" type="Object" />
	</action>
	<action name="queryTest" impl="action:common/CRUD/sqlQuery">
		<private name="db" type="String">vshop</private>
		<private name="sql" type="String">select * from shop where 1=1 and id
			in(:shopIds)
		</private>
		<private name="countSql" type="String">select count(1) from shop where
			1=1 and id in(:shopIds)
		</private>
		<private name="tableName" type="String">shop</private>
		<public name="limit" type="Integer" />
		<public name="offset" type="Integer" />
		<public name="columns" type="String" />
		<public name="orderBy" type="String" />
		<public name="variables" type="Object" />
	</action>
	<action name="saveOrder" impl="action:common/CRUD/save">
		<private name="db" type="String">vshop</private>
		<private name="permissions" type="Object"><![CDATA[{"order_goods":""}]]></private>
		<public name="tables" type="List" />
	</action>
	
	

	<action name="queryByValue" impl="eeda.controller.LatoService.queryByValue" />
	<action name="queryInterface" impl="eeda.controller.LatoService.queryInterface" />
	<action name="createOrder" impl="eeda.controller.LatoService.createOrder" />
	<action name="deleteOrder" impl="eeda.controller.LatoService.deleteOrder" />
	<action name="queryTable" impl="eeda.controller.LatoService.queryTable" />
	<action name="updateOrder" impl="eeda.controller.LatoService.updateOrder" />

	
</model>