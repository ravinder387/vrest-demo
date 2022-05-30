import vweb
import json
import math.stats

// App struct to reference vweb context
struct App {
	vweb.Context
}

// run server
fn main() {
	vweb.run(&App{}, 8080)
}

// struct to store user's json data e.g numeric vector
struct Data {
	data []f64
}

// post handlers
[post; '/mean']
fn (mut app App) ff() vweb.Result {
	 d := json.decode(Data,app.req.data) or {
        			app.set_status(418,"")
        			return app.text("Cannot parse JSON!")
    				}
    	r := stats.mean(d.data)
    	return app.json({
			'result': r
		})
}	