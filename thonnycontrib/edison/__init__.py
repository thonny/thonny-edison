import os.path
from thonny import get_workbench, get_runner
from thonny.ui_utils import select_sequence


def program_edison_enabled():
    code = _get_current_code()
    return code is not None and code.strip() != ""

def _get_current_code():
    editor = get_workbench().get_editor_notebook().get_current_editor()
    if editor is None:
        return None
    return editor.get_code_view().text.get("1.0", "end")

                    
def program_edison():
    get_runner().execute_current("ProgramEdison")

def load_plugin():
    image_path = os.path.join(os.path.dirname(__file__), "res", "tools.program_edison.png")
    get_workbench().add_command("program_edison", "tools", "Send current script to Edison",
                                program_edison,
                                program_edison_enabled,
                                default_sequence=select_sequence("<Control-e>", "<Command-e>"),
                                group=120,
                                image=image_path,
                                caption="Program Edison",
                                include_in_toolbar=True)
