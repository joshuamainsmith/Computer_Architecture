#include <iostream>
#include <fstream>
#include <string>
#include <map>

using namespace std;

int main()
{
	string line, tmpLine1, tmpLine2;
	map<string, string> phone;
	unsigned int i = 0;

	ifstream iFile("import.txt");

	if (iFile.is_open())
	{
		while (getline(iFile, line))
		{
			if (i == 0)
			{
				tmpLine1 = "<div>";
				tmpLine1.append("<strong>");
				tmpLine1.append(line);
				tmpLine1.append("</strong>");
				tmpLine1.append("</div>");

				i++;
			}

			else
			{
				i = 0;

				tmpLine2 = "<div>";
				tmpLine2.append(line);
				tmpLine2.append("</div>");

				phone.insert({ tmpLine1, tmpLine2 });
			}
		}
	}

	iFile.close();

	ofstream oFile("export.txt");

	map<string, string>::iterator itr = phone.begin();

	while (itr != phone.end())
	{
		oFile << itr->first << endl;
		oFile << itr->second << endl;
		oFile << "<br>" << endl;
		itr++;
	}

	oFile.close();

	return 0;
}