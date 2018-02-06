from flask import Flask, render_template
import random

app = Flask(__name__)

# list of cat images
images = [
	"http://media2.giphy.com/media/oYb9gfz1hssOA/giphy.gif",
	"http://media2.giphy.com/media/htRYITliYewYE/giphy.gif",
	"http://media2.giphy.com/media/2gJbvMhUcwVFK/giphy.gif",
	"http://media0.giphy.com/media/6LKjrx6eddMeQ/giphy.gif"
]

@app.route('/')
def index():
    url = random.choice(images)
    return render_template('index.html', url=url)

if __name__ == "__main__":
    app.run(host="0.0.0.0")
