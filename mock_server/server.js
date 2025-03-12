const jsonServer = require('json-server');
const server = jsonServer.create();
const router = jsonServer.router('db.json');
const middlewares = jsonServer.defaults();

server.use(middlewares);

// カーソルページネーションのエンドポイント
server.get('/share-favors', (req, res) => {
	const db = router.db;
	let items = db.get('share-favors').value();

	// `id` で昇順ソート（数値として扱うためにパース）
	items.sort((a, b) => parseInt(a.id, 10) - parseInt(b.id, 10));

	const limit = parseInt(req.query.limit, 10) || 5;  // 1ページの取得件数（デフォルト5）
	const cursor = req.query.cursor ? parseInt(req.query.cursor, 10) : 0; // カーソルID

	// カーソルIDより大きいデータを取得
	const paginatedItems = items.filter(item => parseInt(item.id, 10) > cursor).slice(0, limit);

	// 次のカーソルを設定
	const nextCursor = paginatedItems.length > 0 ? paginatedItems[paginatedItems.length - 1].id : null;

	res.json({
		items: paginatedItems,
		nextCursor: nextCursor ? nextCursor.toString() : null
	});
});

// デフォルトのルート
server.use(router);

server.listen(3000, () => {
	console.log('JSON Server is running on http://localhost:3000');
});
