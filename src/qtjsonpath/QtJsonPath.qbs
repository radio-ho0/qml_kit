import qbs;

Project {
    name: "Qt JSON-path";

    Product {
        name: "qt-json-path";
        type: "staticlibrary";
        targetName: "QtJsonPath";

        Export {
            cpp.includePaths: ".";

            Depends { name: "cpp"; }
            Depends {
                name: "Qt";
                submodules: ["core"];
            }
        }
        Depends { name: "cpp"; }
        Depends {
            name: "Qt";
                submodules: ["core"];
        }
        Group {
            name: "C++ sources";
            files: [
            ]
        }
        Group {
            name: "C++ headers";
            files: [
                "QtJsonPath.h",
            ]
        }
        Group {
            qbs.install: true;
            fileTagsFilter: product.type;
        }
    }
}
