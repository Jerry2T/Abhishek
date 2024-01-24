from fastapi import FastAPI

app=FastAPI()

students={
  1:{
    "name":"sammy",
    "age":32,
    "class":"sp"
  }
}

@app.get("/")
def index():
  return {"name":"First Data"}
  