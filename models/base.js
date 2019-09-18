const knex = require('./knex');

class Base {
	constructor(props) {
		this.table = props;
	}
	all(){
		return knex(this.table).select()
	}
	select(params) {
		return knex(this.table).select().where(params)
	}
	where(params) {
	    return knex(this.table).where(params);
	  }
	insert(params){
		return knex(this.table).insert( params )
	}
	update(id, params ){
		return knex(this.table).where('id', '=', id).update( params )
	}
	delete(id){
		return knex(this.table).where('id', '=', id).del()
	}
	// count(params, dateFilter={}) {
 //    if(dateFilter.column) {
 //      return knex(this.table).where(params)
 //      .whereBetween(dateFilter.column,[`${dateFilter.startAt} 00:00`, `${dateFilter.endAt} 23:59`])
 //      .count('id as total');
 //    }else{
 //      return knex(this.table).where(params).count('id as total');
 //    } 
 //  }
  count(params={}) {
    return knex(this.table).where(params).count('id as sum');
  }
	pagination (pageSize = 20, currentPage = 1, params={}, dateFilter={}) {
    let offset = (currentPage - 1) * pageSize;
    if(dateFilter.column) {
      return knex(this.table)
        .where(params)
        .offset(offset)
        .limit(pageSize)
        .whereBetween(dateFilter.column,[`${dateFilter.startAt} 00:00`, `${dateFilter.endAt} 23:59`])
        .select()

    }else{
      return knex(this.table)
        .where(params)
        .offset(offset)
        .limit(pageSize)
        .select()
    }
  }
}

module.exports = Base;