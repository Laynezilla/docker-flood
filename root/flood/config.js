const CONFIG = {
	baseURI: '/',
	dbCleanInterval: 1000 * 60 * 60,
	dbPath: '/data/flood-db/',
	floodServerPort: 3000,
	maxHistoryStates: 30,
	pollInterval: 1000 * 5,
	secret: process.env.FLOOD_SECRET || 'wmtsflumfyegcclx',
	scgi: {
		socket: true,
		socketPath: '/data/rtorrent.sock'
	}
};

module.exports = CONFIG;
