from fastapi import FastAPI, Response
from fastapi.middleware.cors import CORSMiddleware

with open(".version") as f:
    VERSION = f.read()

app = FastAPI(
    version=VERSION,
    title="Template",
    docs_url="/",
    redoc_url=None
)

# Set up CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/version")
def version(res: Response):
    """A route for health checking"""
    return {"version": VERSION}
