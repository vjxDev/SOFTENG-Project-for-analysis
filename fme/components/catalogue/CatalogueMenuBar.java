/**
 * Project: fuml
 */

package fme.components.catalogue;

import java.awt.Event;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;

import javax.swing.ImageIcon;
import javax.swing.JCheckBoxMenuItem;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.KeyStroke;
import javax.swing.JPopupMenu.Separator;

/**
 * This class represents a menu bar
 * 
 * @author <A href="http://www.ladkau.de" target=newframe>M. Ladkau </A>
 */
public class CatalogueMenuBar extends JMenuBar {

    /**
     * Field for identifying a class
     */
    private static final long serialVersionUID = 2L;

    /**
     * Type of MenuItem's
     */
    private final int LABEL = 1;

    private final int LABEL_WITH_SEPARATOR = 2;

    private final int CHECKBOX_LABEL = 3;

    /**
     * Title for each Menu
     */
    private String[] menuTitle = { "Transformation" };

    /**
     * Key Events for the Menu
     */
    private int[] menuKeyEvent = { KeyEvent.VK_T };

    /**
     * Title for each Menu Item
     */
    private String[][] menuItemTitle = { { "Test Transformation",
        "Test All Transformation", "Apply Transformation",
        "Apply Transformation With Argument", "Description of Transformation" } };

    /**
     * Icon for each Menu Item (the value null will associate no icon)
     */
    private String[][] menuItemIcon = { { null, null, null, null, null } };

    /**
     * To use the Menu with the Keyboard (the value -1 will associate no key)
     */
    private int[][] menuItemKeyEvent = { { KeyEvent.VK_T, KeyEvent.VK_L,
        KeyEvent.VK_A, KeyEvent.VK_G, KeyEvent.VK_D } };

    /**
     * Hot Keys for Menu Items pressed in combination with CTRL (the value -1
     * will associate no key)
     */
    private int[][] menuAccelerator = { { -1, -1, -1, -1, -1 } };

    /**
     * Names for events
     */
    private String[][] event = { { "Menu:TestTransformation",
        "Menu:TestAllTransformation", "Menu:ApplyTransformation","Menu:ApplyTransformationWithArgument",
        "Menu:HelpTransformation" } };

    /**
     * Type of the menues (Label, checkbox,...)
     */
    private int[][] menuItemType = { { LABEL, LABEL, LABEL, LABEL , LABEL } };

    /**
     * The Constructor
     */
    public CatalogueMenuBar(ActionListener listener) {

        JMenuItem menuItem;

        for (int i = 0; i < menuTitle.length; i++) {

            JMenu menu = new JMenu(menuTitle[i]);
            if (menuKeyEvent[i] != -1)
                menu.setMnemonic(menuKeyEvent[i]);

            for (int j = 0; j < menuItemTitle[i].length; j++) {

                if (menuItemType[i][j] == LABEL_WITH_SEPARATOR) {
                    menu.add(new Separator());
                }

                if (menuItemType[i][j] == CHECKBOX_LABEL) {
                    menuItem = new JCheckBoxMenuItem(menuItemTitle[i][j]);
                    ((JCheckBoxMenuItem) menuItem).setState(true);
                } else {
                    menuItem = new JMenuItem(menuItemTitle[i][j]);
                }

                if (menuItemIcon[i][j] != null
                    && !menuItemIcon[i][j].equals(""))
                    menuItem.setIcon(new ImageIcon(menuItemIcon[i][j]));
                else
                    menuItem.setIcon(new ImageIcon(""));

                if (menuItemKeyEvent[i][j] != -1)
                    menuItem.setMnemonic(menuItemKeyEvent[i][j]);

                if (menuAccelerator[i][j] != -1)
                    menuItem.setAccelerator(KeyStroke.getKeyStroke(
                        menuAccelerator[i][j], Event.CTRL_MASK));

                menuItem.setActionCommand(event[i][j]);

                menuItem.addActionListener(listener);

                menu.add(menuItem);

            }
            add(menu);
        }
    }
}
