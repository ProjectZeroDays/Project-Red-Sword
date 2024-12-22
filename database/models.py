
from sqlalchemy import create_engine, Column, String, Integer, Text
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

Base = declarative_base()

class DocumentAnalysis(Base):
    __tablename__ = "document_analysis"
    id = Column(Integer, primary_key=True, autoincrement=True)
    source = Column(String, nullable=False)
    title = Column(String, nullable=True)
    links = Column(Text, nullable=True)
    error = Column(Text, nullable=True)

DATABASE_URL = "sqlite:///document_analysis.db"
engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base.metadata.create_all(bind=engine)
