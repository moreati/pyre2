#!/usr/bin/env python

from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext
import os

BASE_DIR = os.path.dirname(__file__)

def get_long_description():
    readme_f = open(os.path.join(BASE_DIR, "README.rst"))
    readme = readme_f.read()
    readme_f.close()
    
    return readme
    
setup(
    name="re2",
    version="0.1.0cython",
    description="Python wrapper for Google's RE2 (using Cython)",
    long_description=get_long_description(),
    url="http://github.com/facebook/pyre2/",
    
    author="David Reiss",
    
    classifiers = [
        "Development Status :: 3 - Alpha",
        "Intended Audience :: Developers",
        "License :: OSI Approved :: BSD License",
        "Operating System :: OS Independent",
        "Programming Language :: Python",
        "Topic :: Scientific/Engineering :: Information Analysis",
        "Topic :: Software Development :: Libraries :: Python Modules",
        "Topic :: Text Processing",
        "Topic :: Text Processing :: General",
        ],
    
    cmdclass = {"build_ext": build_ext},
    py_modules = ["re2"],
    
    ext_modules = [Extension("_re2",
      sources = ["_re2.pyx"],
      language="c++",
      libraries = ["re2"],
      )],
    )
