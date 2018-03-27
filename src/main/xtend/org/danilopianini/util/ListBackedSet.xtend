package org.danilopianini.util

import java.util.List
import org.apache.commons.collections4.list.SetUniqueList
import org.eclipse.xtend.lib.annotations.Accessors
import org.eclipse.xtend.lib.annotations.Delegate
import java.util.Comparator

@Accessors(PROTECTED_GETTER, PROTECTED_SETTER)
class ListBackedSet<E> implements ListSet<E> {

	@Delegate val SetUniqueList<E> backend
	val List<E> base;

	new(List<E> base) {
		this.base = base;
		backend = SetUniqueList.setUniqueList(base)
	}
	
	override def sort(Comparator<? super E> c) {
		base.sort(c)
	}

	override def toString() {
		base.toString
	}
	
	override def hashCode() {
		base.hashCode
	}
	
	override def equals(Object o) {
		base.equals(o)
	}
	
}