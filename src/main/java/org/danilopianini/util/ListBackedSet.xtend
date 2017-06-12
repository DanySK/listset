package org.danilopianini.util

import java.util.List
import org.apache.commons.collections4.list.SetUniqueList
import org.eclipse.xtend.lib.annotations.Accessors
import org.eclipse.xtend.lib.annotations.Delegate

@Accessors(PROTECTED_GETTER, PROTECTED_SETTER)
class ListBackedSet<E> implements ListSet<E> {

	@Delegate val SetUniqueList<E> backend

	new(List<E> base) {
		backend = SetUniqueList.setUniqueList(base)
	}

}