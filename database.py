import sqlite3
import os
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

engine = create_engine('sqlite:///app.db')
session_db = sessionmaker()
session_db.configure(bind=engine)