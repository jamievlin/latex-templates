#!/usr/bin/env python3
import sys
import os
import io
import PyPDF2 as pdf

def main(args):
    if len(args) <= 1:
        print('splitfiles filename')
        exit()
    filename = args[1]
    filename_dir = os.path.dirname(filename)

    crowdmark_dir = os.path.join(filename_dir, 'crowdmark')
    if not os.path.isdir(crowdmark_dir):
        os.makedirs(crowdmark_dir)

    pdffile = io.FileIO(filename, 'rb')
    main_pdf = pdf.PdfFileReader(pdffile)

    problem_counter = 0

    base_name = os.path.splitext(os.path.basename(filename))[0]
    problems = list(filter(lambda obj: isinstance(obj, dict), main_pdf.outlines))

    final_path = os.path.join(crowdmark_dir, str.format(
        '{}-p{}.pdf', base_name, str(problem_counter)))

    page_counter = 0

    for i in range(len(problems)):
        problem = problems[i]
        title, prob_page = problem.title, problem.page.getObject()
        assert(main_pdf.pages[page_counter] == prob_page)
        print('Processing problem {0}. Title is "{1}"'.format(i + 1, title))

        problem_pdf = pdf.PdfFileWriter()

        while page_counter < len(main_pdf.pages) and \
            (i + 1 >= len(problems) or \
            main_pdf.pages[page_counter] != problems[i + 1].page.getObject()):
            problem_pdf.addPage(main_pdf.pages[page_counter])
            page_counter += 1

        formatted_problem_title = title.replace(' ', '_').lower()
        final_file_name = str.format(
            '{}_p{}_{}.pdf', base_name, str(i + 1), formatted_problem_title)
        final_path = os.path.join(crowdmark_dir, final_file_name)

        with io.open(final_path, 'wb') as prob_file:
            problem_pdf.write(prob_file)
        del problem_pdf
    pdffile.close()

if __name__ == '__main__':
    main(sys.argv)
