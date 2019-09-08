const Base = require('./Base.js');
class Article extends Base {
	constructor(props = 'article') {
		super(props)
	}
}

module.exports = new Article();
